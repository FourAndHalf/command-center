import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';
import 'daos/decisions_dao.dart';
import 'daos/goals_dao.dart';
import 'daos/reviews_dao.dart';
import 'daos/schedules_dao.dart';
import 'daos/entities_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Decisions,
    DecisionVersions,
    Assumptions,
    DecisionRisks,
    DecisionAdvice,
    DecisionReviews,
    Goals,
    GoalVersions,
    GoalCheckins,
    ReviewSchedules,
    Entities,
    Relations,
    Events,
    Reflections,
  ],
  daos: [DecisionsDao, GoalsDao, ReviewsDao, SchedulesDao, EntitiesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'command_center.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
