// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_dao.dart';

// ignore_for_file: type=lint
mixin _$ReviewsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DecisionsTable get decisions => attachedDatabase.decisions;
  $DecisionReviewsTable get decisionReviews => attachedDatabase.decisionReviews;
  ReviewsDaoManager get managers => ReviewsDaoManager(this);
}

class ReviewsDaoManager {
  final _$ReviewsDaoMixin _db;
  ReviewsDaoManager(this._db);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db.attachedDatabase, _db.decisions);
  $$DecisionReviewsTableTableManager get decisionReviews =>
      $$DecisionReviewsTableTableManager(
        _db.attachedDatabase,
        _db.decisionReviews,
      );
}
