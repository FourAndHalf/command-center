// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_dao.dart';

// ignore_for_file: type=lint
mixin _$SchedulesDaoMixin on DatabaseAccessor<AppDatabase> {
  $DecisionsTable get decisions => attachedDatabase.decisions;
  $GoalsTable get goals => attachedDatabase.goals;
  $ReviewSchedulesTable get reviewSchedules => attachedDatabase.reviewSchedules;
  SchedulesDaoManager get managers => SchedulesDaoManager(this);
}

class SchedulesDaoManager {
  final _$SchedulesDaoMixin _db;
  SchedulesDaoManager(this._db);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db.attachedDatabase, _db.decisions);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$ReviewSchedulesTableTableManager get reviewSchedules =>
      $$ReviewSchedulesTableTableManager(
        _db.attachedDatabase,
        _db.reviewSchedules,
      );
}
