// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decisions_dao.dart';

// ignore_for_file: type=lint
mixin _$DecisionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DecisionsTable get decisions => attachedDatabase.decisions;
  $DecisionVersionsTable get decisionVersions =>
      attachedDatabase.decisionVersions;
  $AssumptionsTable get assumptions => attachedDatabase.assumptions;
  $DecisionRisksTable get decisionRisks => attachedDatabase.decisionRisks;
  $EntitiesTable get entities => attachedDatabase.entities;
  $DecisionAdviceTable get decisionAdvice => attachedDatabase.decisionAdvice;
  DecisionsDaoManager get managers => DecisionsDaoManager(this);
}

class DecisionsDaoManager {
  final _$DecisionsDaoMixin _db;
  DecisionsDaoManager(this._db);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db.attachedDatabase, _db.decisions);
  $$DecisionVersionsTableTableManager get decisionVersions =>
      $$DecisionVersionsTableTableManager(
        _db.attachedDatabase,
        _db.decisionVersions,
      );
  $$AssumptionsTableTableManager get assumptions =>
      $$AssumptionsTableTableManager(_db.attachedDatabase, _db.assumptions);
  $$DecisionRisksTableTableManager get decisionRisks =>
      $$DecisionRisksTableTableManager(_db.attachedDatabase, _db.decisionRisks);
  $$EntitiesTableTableManager get entities =>
      $$EntitiesTableTableManager(_db.attachedDatabase, _db.entities);
  $$DecisionAdviceTableTableManager get decisionAdvice =>
      $$DecisionAdviceTableTableManager(
        _db.attachedDatabase,
        _db.decisionAdvice,
      );
}
