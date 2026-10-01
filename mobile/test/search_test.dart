import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/providers.dart';
import 'package:mobile/data/database.dart';
import 'package:mobile/features/search/search_screen.dart';

void main() {
  testWidgets('search finds a decision by title', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    await db.decisionsDao.insertDecision(DecisionsCompanion.insert(
      id: 'd1',
      title: 'Move into robotics',
      type: 'career',
    ));
    await tester.pumpWidget(ProviderScope(
      overrides: [databaseProvider.overrideWithValue(db)],
      child: const MaterialApp(home: SearchScreen()),
    ));
    await tester.enterText(find.byType(TextField), 'robot');
    await tester.pump();
    await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 200)));
    await tester.pump();
    expect(find.text('Move into robotics'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 1));
    await db.close();
  });
}
