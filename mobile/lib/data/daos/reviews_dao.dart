import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'reviews_dao.g.dart';

@DriftAccessor(tables: [DecisionReviews])
class ReviewsDao extends DatabaseAccessor<AppDatabase> with _$ReviewsDaoMixin {
  ReviewsDao(super.db);

  Stream<List<DecisionReview>> watchForDecision(String decisionId) =>
      (select(decisionReviews)
            ..where((r) => r.decisionId.equals(decisionId))
            ..orderBy([(r) => OrderingTerm.asc(r.reviewedAt)]))
          .watch();

  /// DecisionReview is immutable history (docs/prompt.md §8): this DAO only
  /// ever inserts. There is no update/delete method for reviews by design.
  Future<void> insertReview(Insertable<DecisionReview> review) =>
      into(decisionReviews).insert(review);
}
