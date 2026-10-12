import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/providers.dart';
import 'package:mobile/data/database.dart';
import 'package:mobile/features/timeline/timeline_entry.dart';
import 'package:mobile/features/timeline/timeline_screen.dart';

void main() {
  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.decisionsDao.insertDecision(
      DecisionsCompanion.insert(
        id: 'd1',
        title: 'Move into robotics',
        type: 'career',
        decisionAt: Value(DateTime(2026, 3, 10)),
      ),
    );
    await db.reviewsDao.insertReview(
      DecisionReviewsCompanion.insert(
        id: 'r1',
        decisionId: 'd1',
        reviewedAt: Value(DateTime(2026, 5, 2)),
        lesson: const Value('Start smaller'),
      ),
    );
    await db.decisionsDao.insertRisk(
      DecisionRisksCompanion.insert(
        id: 'k1',
        decisionId: 'd1',
        statement: 'Market shrinks',
        notedAt: Value(DateTime(2026, 3, 11)),
      ),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('entries merge newest-first and land on the right side', () async {
    final entries = buildTimelineEntries(
      decisions: await db.decisionsDao.watchAll().first,
      reviews: await db.reviewsDao.watchAll().first,
      goals: const [],
      events: const [],
      risks: await db.decisionsDao.watchAllRisks().first,
      advice: const [],
      checkins: const [],
    );

    expect(entries.map((e) => e.kind), [
      TimelineKind.review,
      TimelineKind.risk,
      TimelineKind.decision,
    ]);
    expect(entries.first.title, 'Move into robotics');
    expect(entries.first.subtitle, 'Start smaller');
    expect(entries[1].side, TimelineSide.right);
    expect(entries[1].parent, 'Move into robotics');
    expect(entries[2].side, TimelineSide.left);
    expect(entries[2].route, '/decisions/d1');
  });

  testWidgets('screen shows decisions and signals', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const MaterialApp(home: TimelineScreen()),
      ),
    );
    await tester.runAsync(
      () => Future.delayed(const Duration(milliseconds: 200)),
    );
    await tester.pump();

    expect(find.text('Market shrinks'), findsOneWidget);
    expect(find.text('Start smaller'), findsOneWidget);

    await tester.tap(find.text('Signals'));
    await tester.pump();
    expect(find.text('Market shrinks'), findsOneWidget);
    expect(find.text('Start smaller'), findsNothing);

    // Tapping a signal expands it in place and offers a link to the record.
    expect(find.text('OPEN RECORD →'), findsNothing);
    await tester.tap(find.text('Market shrinks'));
    await tester.pump();
    expect(find.text('OPEN RECORD →'), findsOneWidget);

    // Unmount so drift's stream-cancel timers fire before the test ends.
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 1));
  });

  test(
    'project entries appear as dated timeline records with a project route',
    () async {
      final project = await db.projectsDao.createProject(name: 'Cardboard');
      await db.projectsDao.recordIntent(
        projectId: project,
        focus: 'Verify native editing access',
        recordedAt: DateTime(2026, 6, 1),
      );
      final results = (await db.projectsDao.watchRecentEntries().first)
          .where((result) => result.entry.logicalKind == 'intent')
          .toList();
      final entries = buildTimelineEntries(
        decisions: const [],
        reviews: const [],
        goals: const [],
        events: const [],
        risks: const [],
        advice: const [],
        checkins: const [],
        projectEntries: results,
      );

      expect(entries.single.kind, TimelineKind.project);
      expect(entries.single.title, 'Verify native editing access');
      expect(entries.single.subtitle, 'Cardboard');
      expect(entries.single.route, '/projects/$project');
    },
  );
}
