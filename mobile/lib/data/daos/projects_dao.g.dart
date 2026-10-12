// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_dao.dart';

// ignore_for_file: type=lint
mixin _$ProjectsDaoMixin on DatabaseAccessor<AppDatabase> {
  $EntitiesTable get entities => attachedDatabase.entities;
  $ProjectEntriesTable get projectEntries => attachedDatabase.projectEntries;
  $ProjectEntryEvidenceTable get projectEntryEvidence =>
      attachedDatabase.projectEntryEvidence;
  ProjectsDaoManager get managers => ProjectsDaoManager(this);
}

class ProjectsDaoManager {
  final _$ProjectsDaoMixin _db;
  ProjectsDaoManager(this._db);
  $$EntitiesTableTableManager get entities =>
      $$EntitiesTableTableManager(_db.attachedDatabase, _db.entities);
  $$ProjectEntriesTableTableManager get projectEntries =>
      $$ProjectEntriesTableTableManager(
        _db.attachedDatabase,
        _db.projectEntries,
      );
  $$ProjectEntryEvidenceTableTableManager get projectEntryEvidence =>
      $$ProjectEntryEvidenceTableTableManager(
        _db.attachedDatabase,
        _db.projectEntryEvidence,
      );
}
