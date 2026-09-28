// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities_dao.dart';

// ignore_for_file: type=lint
mixin _$EntitiesDaoMixin on DatabaseAccessor<AppDatabase> {
  $EntitiesTable get entities => attachedDatabase.entities;
  $RelationsTable get relations => attachedDatabase.relations;
  $EventsTable get events => attachedDatabase.events;
  EntitiesDaoManager get managers => EntitiesDaoManager(this);
}

class EntitiesDaoManager {
  final _$EntitiesDaoMixin _db;
  EntitiesDaoManager(this._db);
  $$EntitiesTableTableManager get entities =>
      $$EntitiesTableTableManager(_db.attachedDatabase, _db.entities);
  $$RelationsTableTableManager get relations =>
      $$RelationsTableTableManager(_db.attachedDatabase, _db.relations);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db.attachedDatabase, _db.events);
}
