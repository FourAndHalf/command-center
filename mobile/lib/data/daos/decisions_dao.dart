import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'decisions_dao.g.dart';

@DriftAccessor(
  tables: [Decisions, DecisionVersions, Assumptions, DecisionRisks, DecisionAdvice],
)
class DecisionsDao extends DatabaseAccessor<AppDatabase> with _$DecisionsDaoMixin {
  DecisionsDao(super.db);

  /// Permanently removes a decision and everything that hangs off it. SQLite
  /// foreign keys are not enforced here, so dependants are deleted explicitly,
  /// all in one transaction. This is a deliberate, user-confirmed erasure.
  Future<void> deleteDecision(String id) async {
    final d = attachedDatabase;
    await transaction(() async {
      final reviewIds = (await (d.select(d.decisionReviews)
                ..where((r) => r.decisionId.equals(id)))
              .get())
          .map((r) => r.id)
          .toList();

      if (reviewIds.isNotEmpty) {
        await (d.delete(d.projectReviewEntries)
              ..where((l) => l.reviewId.isIn(reviewIds)))
            .go();
      }
      await (d.delete(d.relations)
            ..where((r) =>
                (r.sourceType.equals('decision') & r.sourceId.equals(id)) |
                (r.targetType.equals('decision') & r.targetId.equals(id)) |
                (r.sourceType.equals('review') & r.sourceId.isIn(reviewIds)) |
                (r.targetType.equals('review') & r.targetId.isIn(reviewIds))))
          .go();
      await (d.delete(d.decisionReviews)..where((r) => r.decisionId.equals(id)))
          .go();
      await (d.delete(d.reviewSchedules)..where((s) => s.decisionId.equals(id)))
          .go();
      await (d.delete(d.decisionAdvice)..where((a) => a.decisionId.equals(id)))
          .go();
      await (d.delete(d.decisionRisks)..where((r) => r.decisionId.equals(id)))
          .go();
      await (d.delete(d.assumptions)..where((a) => a.decisionId.equals(id)))
          .go();
      await (d.delete(d.decisionVersions)
            ..where((v) => v.decisionId.equals(id)))
          .go();
      await (d.delete(d.decisions)..where((x) => x.id.equals(id))).go();
    });
  }

  Stream<List<Decision>> watchAll() => select(decisions).watch();

  Stream<List<Decision>> watchByStatus(String status) =>
      (select(decisions)..where((d) => d.status.equals(status))).watch();

  Future<Decision?> getById(String id) =>
      (select(decisions)..where((d) => d.id.equals(id))).getSingleOrNull();

  Future<void> insertDecision(Insertable<Decision> decision) =>
      into(decisions).insert(decision);

  /// Editing a decision never overwrites it: this snapshots the current row
  /// into decision_versions first, then applies the change. v1 is the first
  /// snapshot taken and is never deleted or rewritten.
  Future<void> updateWithVersion(
    Decision updated,
    Map<String, dynamic> previousSnapshot,
  ) async {
    await transaction(() async {
      final existingVersions = await (select(decisionVersions)
            ..where((v) => v.decisionId.equals(updated.id)))
          .get();
      final nextVersionNo = existingVersions.length + 1;

      await into(decisionVersions).insert(DecisionVersionsCompanion.insert(
        id: '${updated.id}-v$nextVersionNo-${DateTime.now().microsecondsSinceEpoch}',
        decisionId: updated.id,
        versionNo: nextVersionNo,
        snapshot: previousSnapshot,
      ));

      await update(decisions).replace(updated);
    });
  }

  Stream<List<DecisionVersion>> watchVersions(String decisionId) =>
      (select(decisionVersions)
            ..where((v) => v.decisionId.equals(decisionId))
            ..orderBy([(v) => OrderingTerm.asc(v.versionNo)]))
          .watch();

  Stream<List<Assumption>> watchAssumptions(String decisionId) =>
      (select(assumptions)..where((a) => a.decisionId.equals(decisionId)))
          .watch();

  Future<void> insertAssumption(Insertable<Assumption> a) => into(assumptions).insert(a);

  Future<void> updateAssumption(Assumption a) =>
      update(assumptions).replace(a);

  Stream<List<DecisionRisk>> watchRisks(String decisionId) =>
      (select(decisionRisks)..where((r) => r.decisionId.equals(decisionId)))
          .watch();

  Future<void> insertRisk(Insertable<DecisionRisk> r) => into(decisionRisks).insert(r);

  Future<void> markRiskHappened(String riskId, bool happened) =>
      (update(decisionRisks)..where((r) => r.id.equals(riskId)))
          .write(DecisionRisksCompanion(happened: Value(happened)));

  Stream<List<DecisionAdviceData>> watchAdvice(String decisionId) =>
      (select(decisionAdvice)..where((a) => a.decisionId.equals(decisionId)))
          .watch();

  Future<void> insertAdvice(Insertable<DecisionAdviceData> a) =>
      into(decisionAdvice).insert(a);

  Future<void> setAdviceHeldUp(String adviceId, String heldUp) =>
      (update(decisionAdvice)..where((a) => a.id.equals(adviceId)))
          .write(DecisionAdviceCompanion(heldUp: Value(heldUp)));

  Stream<List<DecisionRisk>> watchAllRisks() => select(decisionRisks).watch();

  Stream<List<DecisionAdviceData>> watchAllAdvice() =>
      select(decisionAdvice).watch();
}
