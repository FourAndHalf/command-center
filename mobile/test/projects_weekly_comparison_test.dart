import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/providers.dart';
import 'package:mobile/data/database.dart';
import 'package:mobile/features/projects/project_weekly_comparison_screen.dart';

void main() {
  testWidgets('shows expected and observed records for the current week', (
    tester,
  ) async {
    final db = AppDatabase(NativeDatabase.memory());
    final project = await db.projectsDao.createProject(name: 'Weekly project');
    final now = DateTime.now();
    final intent = await db.projectsDao.recordIntent(
      projectId: project,
      focus: 'Test the weekly view',
      localDay: _day(now),
      recordedAt: now,
    );
    await db.projectsDao.recordObservation(
      projectId: project,
      observedResult: 'The weekly view is readable',
      relatedEntryId: intent,
      localDay: _day(now),
      recordedAt: now.add(const Duration(seconds: 1)),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: MaterialApp(
          home: ProjectWeeklyComparisonScreen(projectId: project),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Expected'), findsOneWidget);
    expect(find.text('Observed'), findsOneWidget);
    expect(find.text('Test the weekly view'), findsOneWidget);
    expect(find.text('The weekly view is readable'), findsOneWidget);

    await db.close();
  });
}

String _day(DateTime value) =>
    '${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';
