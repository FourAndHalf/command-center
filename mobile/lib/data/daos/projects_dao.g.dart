// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_dao.dart';

// ignore_for_file: type=lint
mixin _$ProjectsDaoMixin on DatabaseAccessor<AppDatabase> {
  $EntitiesTable get entities => attachedDatabase.entities;
  $RelationsTable get relations => attachedDatabase.relations;
  $DecisionsTable get decisions => attachedDatabase.decisions;
  $DecisionReviewsTable get decisionReviews => attachedDatabase.decisionReviews;
  $ProjectEntriesTable get projectEntries => attachedDatabase.projectEntries;
  $ProjectEntryEvidenceTable get projectEntryEvidence =>
      attachedDatabase.projectEntryEvidence;
  $ProjectReviewEntriesTable get projectReviewEntries =>
      attachedDatabase.projectReviewEntries;
  ProjectsDaoManager get managers => ProjectsDaoManager(this);
}

class ProjectsDaoManager {
  final _$ProjectsDaoMixin _db;
  ProjectsDaoManager(this._db);
  $$EntitiesTableTableManager get entities =>
      $$EntitiesTableTableManager(_db.attachedDatabase, _db.entities);
  $$RelationsTableTableManager get relations =>
      $$RelationsTableTableManager(_db.attachedDatabase, _db.relations);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db.attachedDatabase, _db.decisions);
  $$DecisionReviewsTableTableManager get decisionReviews =>
      $$DecisionReviewsTableTableManager(
        _db.attachedDatabase,
        _db.decisionReviews,
      );
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
  $$ProjectReviewEntriesTableTableManager get projectReviewEntries =>
      $$ProjectReviewEntriesTableTableManager(
        _db.attachedDatabase,
        _db.projectReviewEntries,
      );
}
