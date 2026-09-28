import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/data/database.dart';

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
}
