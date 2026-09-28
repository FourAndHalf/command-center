import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'goals_dao.g.dart';

@DriftAccessor(tables: [Goals, GoalVersions, GoalCheckins])
class GoalsDao extends DatabaseAccessor<AppDatabase> with _$GoalsDaoMixin {
  GoalsDao(super.db);

  Stream<List<Goal>> watchAll() => select(goals).watch();

  Stream<List<Goal>> watchByHorizon(String horizon) =>
      (select(goals)..where((g) => g.horizon.equals(horizon))).watch();

  Stream<List<Goal>> watchChildren(String parentGoalId) =>
      (select(goals)..where((g) => g.parentGoalId.equals(parentGoalId)))
          .watch();

  Future<void> insertGoal(Insertable<Goal> goal) => into(goals).insert(goal);

  /// Same rule as decisions: edits are versioned, status changes are
  /// recorded with a date and note (docs/prompt.md §10).
  Future<void> updateWithVersion(
    Goal updated,
    Map<String, dynamic> previousSnapshot,
  ) async {
    await transaction(() async {
      final existing = await (select(goalVersions)
            ..where((v) => v.goalId.equals(updated.id)))
          .get();
      final nextVersionNo = existing.length + 1;

      await into(goalVersions).insert(GoalVersionsCompanion.insert(
        id: '${updated.id}-v$nextVersionNo-${DateTime.now().microsecondsSinceEpoch}',
        goalId: updated.id,
        versionNo: nextVersionNo,
        snapshot: previousSnapshot,
      ));

      await update(goals).replace(updated);
    });
  }

  Stream<List<GoalVersion>> watchVersions(String goalId) =>
      (select(goalVersions)
            ..where((v) => v.goalId.equals(goalId))
            ..orderBy([(v) => OrderingTerm.asc(v.versionNo)]))
          .watch();

  Stream<List<GoalCheckin>> watchCheckins(String goalId) =>
      (select(goalCheckins)..where((c) => c.goalId.equals(goalId))).watch();

  /// Check-ins are append-only, like reviews.
  Future<void> insertCheckin(Insertable<GoalCheckin> checkin) =>
      into(goalCheckins).insert(checkin);
}
