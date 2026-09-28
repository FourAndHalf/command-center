// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_dao.dart';

// ignore_for_file: type=lint
mixin _$GoalsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GoalsTable get goals => attachedDatabase.goals;
  $GoalVersionsTable get goalVersions => attachedDatabase.goalVersions;
  $GoalCheckinsTable get goalCheckins => attachedDatabase.goalCheckins;
  GoalsDaoManager get managers => GoalsDaoManager(this);
}

class GoalsDaoManager {
  final _$GoalsDaoMixin _db;
  GoalsDaoManager(this._db);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$GoalVersionsTableTableManager get goalVersions =>
      $$GoalVersionsTableTableManager(_db.attachedDatabase, _db.goalVersions);
  $$GoalCheckinsTableTableManager get goalCheckins =>
      $$GoalCheckinsTableTableManager(_db.attachedDatabase, _db.goalCheckins);
}
