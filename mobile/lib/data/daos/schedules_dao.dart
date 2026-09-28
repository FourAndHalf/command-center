import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'schedules_dao.g.dart';

/// Covers reviews, tripwires, cool-off revisits, decide_by reminders, goal
/// check-in schedules, and periodic reflections — all one scheduler
/// (docs/prompt.md §12).
@DriftAccessor(tables: [ReviewSchedules])
class SchedulesDao extends DatabaseAccessor<AppDatabase>
    with _$SchedulesDaoMixin {
  SchedulesDao(super.db);

  Stream<List<ReviewSchedule>> watchDueToday() {
    final now = DateTime.now();
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return (select(reviewSchedules)
          ..where((s) =>
              s.active.equals(true) &
              s.nextDueAt.isSmallerOrEqualValue(endOfDay) &
              s.snoozedUntil.isNull()))
        .watch();
  }

  Stream<List<ReviewSchedule>> watchOverdue() {
    final now = DateTime.now();
    return (select(reviewSchedules)
          ..where((s) =>
              s.active.equals(true) &
              s.nextDueAt.isSmallerThanValue(now) &
              s.snoozedUntil.isNull()))
        .watch();
  }

  Stream<List<ReviewSchedule>> watchUpcoming({int withinDays = 14}) {
    final now = DateTime.now();
    final horizon = now.add(Duration(days: withinDays));
    return (select(reviewSchedules)
          ..where((s) =>
              s.active.equals(true) &
              s.nextDueAt.isBiggerThanValue(now) &
              s.nextDueAt.isSmallerOrEqualValue(horizon)))
        .watch();
  }

  Future<void> insertSchedule(Insertable<ReviewSchedule> schedule) =>
      into(reviewSchedules).insert(schedule);

  /// Snoozing preserves the original due date: it only sets snoozed_until.
  Future<void> snooze(String scheduleId, DateTime until) =>
      (update(reviewSchedules)..where((s) => s.id.equals(scheduleId)))
          .write(ReviewSchedulesCompanion(snoozedUntil: Value(until)));

  /// Completing a schedule can set the next due date (for a recurring
  /// review) or deactivate it (one-off: cool-off, decide_by, tripwire).
  Future<void> complete(String scheduleId, {DateTime? nextDueAt}) =>
      (update(reviewSchedules)..where((s) => s.id.equals(scheduleId))).write(
        ReviewSchedulesCompanion(
          lastCompletedAt: Value(DateTime.now()),
          snoozedUntil: const Value(null),
          nextDueAt: Value(nextDueAt),
          active: Value(nextDueAt != null),
        ),
      );

  Future<void> dismiss(String scheduleId) =>
      (update(reviewSchedules)..where((s) => s.id.equals(scheduleId)))
          .write(const ReviewSchedulesCompanion(active: Value(false)));
}
