import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/data/database.dart';
import 'package:mobile/data/export_service.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('editing a decision keeps v1 and adds a new version', () async {
    final decision = DecisionsCompanion.insert(
      id: 'd1',
      title: 'Move into robotics',
      type: 'career',
    );
    await db.decisionsDao.insertDecision(decision);

    final v1 = (await db.decisionsDao.getById('d1'))!;
    final v1Snapshot = {'title': v1.title, 'objective': v1.objective};

    final v2 = v1.copyWith(
      title: 'Move into robotics within 18 months',
      objective: const Value('Become employable in robotics'),
    );
    await db.decisionsDao.updateWithVersion(v2, v1Snapshot);

    final current = (await db.decisionsDao.getById('d1'))!;
    expect(current.title, 'Move into robotics within 18 months');

    final versions = await db.decisionsDao.watchVersions('d1').first;
    expect(versions, hasLength(1));
    expect(versions.first.versionNo, 1);
    expect(versions.first.snapshot['title'], 'Move into robotics');
  });

  test('decision reviews are append-only history', () async {
    await db.decisionsDao.insertDecision(
      DecisionsCompanion.insert(id: 'd1', title: 'Leave company A', type: 'career'),
    );

    await db.reviewsDao.insertReview(DecisionReviewsCompanion.insert(
      id: 'r1',
      decisionId: 'd1',
      whatActuallyHappened: const Value('Left after 6 months'),
    ));
    await db.reviewsDao.insertReview(DecisionReviewsCompanion.insert(
      id: 'r2',
      decisionId: 'd1',
      whatActuallyHappened: const Value('One year later, still glad'),
    ));

    final reviews = await db.reviewsDao.watchForDecision('d1').first;
    expect(reviews, hasLength(2));
    expect(reviews.map((r) => r.id), containsAll(['r1', 'r2']));
  });

  test('snoozing a review schedule preserves the original due date', () async {
    final originalDue = DateTime(2027, 1, 1);
    await db.schedulesDao.insertSchedule(ReviewSchedulesCompanion.insert(
      id: 's1',
      triggerType: 'time',
      nextDueAt: Value(originalDue),
    ));

    final snoozeUntil = DateTime(2027, 1, 10);
    await db.schedulesDao.snooze('s1', snoozeUntil);

    final schedule = await (db.select(db.reviewSchedules)
          ..where((s) => s.id.equals('s1')))
        .getSingle();

    expect(schedule.nextDueAt, originalDue);
    expect(schedule.snoozedUntil, snoozeUntil);
  });

  test('goal edits are versioned like decisions', () async {
    await db.goalsDao.insertGoal(GoalsCompanion.insert(
      id: 'g1',
      title: 'Learn robotics fundamentals',
      horizon: '1_year',
    ));

    final g1 = (await (db.select(db.goals)..where((g) => g.id.equals('g1')))
        .getSingle());
    final snapshot = {'title': g1.title, 'status': g1.status};

    final updated = g1.copyWith(status: 'achieved');
    await db.goalsDao.updateWithVersion(updated, snapshot);

    final versions = await db.goalsDao.watchVersions('g1').first;
    expect(versions, hasLength(1));
    expect(versions.first.snapshot['status'], 'active');

    final current =
        await (db.select(db.goals)..where((g) => g.id.equals('g1'))).getSingle();
    expect(current.status, 'achieved');
  });

  test('imports an exported JSON snapshot and replaces existing data', () async {
    await db.decisionsDao.insertDecision(
      DecisionsCompanion.insert(id: 'old', title: 'Old data', type: 'other'),
    );
    final service = ExportService(db);
    final file = File('${Directory.systemTemp.path}/command-center-test.json');
    await file.writeAsString(jsonEncode({
      'format_version': 1,
      'decisions': [
        {
          'id': 'new',
          'title': 'Imported decision',
          'type': 'career',
          'status': 'active',
          'decisionAt': null,
          'context': null,
          'objective': null,
          'rationale': null,
          'alternatives': null,
          'constraints': null,
          'emotionalContext': null,
          'expectedOutcome': null,
          'successCriteria': null,
          'failureConditions': null,
          'confidence': null,
          'importance': null,
          'reversibility': null,
          'decideBy': null,
          'openQuestions': null,
          'tags': null,
          'createdAt': DateTime(2026, 1, 1).millisecondsSinceEpoch,
          'updatedAt': DateTime(2026, 1, 1).millisecondsSinceEpoch,
        },
      ],
    }));

    final summary = await service.importFromJson(file);
    expect(summary.rowCount, 1);
    expect(await db.decisionsDao.getById('old'), isNull);
    expect((await db.decisionsDao.getById('new'))?.title, 'Imported decision');
    await file.delete();
  });

  test('rejects malformed import before changing the database', () async {
    await db.decisionsDao.insertDecision(
      DecisionsCompanion.insert(id: 'keep', title: 'Keep me', type: 'other'),
    );
    final service = ExportService(db);
    final file = File('${Directory.systemTemp.path}/command-center-bad.json');
    await file.writeAsString('{"decisions": "not an array"}');

    await expectLater(service.importFromJson(file), throwsFormatException);
    expect((await db.decisionsDao.getById('keep'))?.title, 'Keep me');
    await file.delete();
  });
}
