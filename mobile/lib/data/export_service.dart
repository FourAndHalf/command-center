import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

import 'database.dart';

/// Full export to JSON (docs/prompt.md §27). Field names match the table
/// definitions in tables.dart, which in turn mirror the backend's eventual
/// Postgres columns — so this file can later be posted to the backend API
/// without renaming fields. Timestamps serialize as epoch milliseconds
/// (Drift's default `toJson()`); a backend importer needs a trivial
/// epoch-ms -> timestamptz conversion, not a schema change.
class ExportService {
  ExportService(this._db);

  final AppDatabase _db;

  Future<File> exportAllToJson() async {
    final payload = {
      'format_version': 2,
      'exported_at': DateTime.now().toIso8601String(),
      'decisions': await _db.select(_db.decisions).get(),
      'decision_versions': await _db.select(_db.decisionVersions).get(),
      'assumptions': await _db.select(_db.assumptions).get(),
      'decision_risks': await _db.select(_db.decisionRisks).get(),
      'decision_advice': await _db.select(_db.decisionAdvice).get(),
      'decision_reviews': await _db.select(_db.decisionReviews).get(),
      'goals': await _db.select(_db.goals).get(),
      'goal_versions': await _db.select(_db.goalVersions).get(),
      'goal_checkins': await _db.select(_db.goalCheckins).get(),
      'review_schedules': await _db.select(_db.reviewSchedules).get(),
      'entities': await _db.select(_db.entities).get(),
      'relations': await _db.select(_db.relations).get(),
      'events': await _db.select(_db.events).get(),
      'reflections': await _db.select(_db.reflections).get(),
      'project_entries': await _db.select(_db.projectEntries).get(),
      'project_entry_evidence': await _db
          .select(_db.projectEntryEvidence)
          .get(),
      'project_review_entries': await _db
          .select(_db.projectReviewEntries)
          .get(),
    };

    final dir = await getApplicationDocumentsDirectory();
    final file = File(
      '${dir.path}/command-center-export-${DateTime.now().millisecondsSinceEpoch}.json',
    );
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(payload),
    );
    return file;
  }

  /// Replaces the local database with a previously exported JSON snapshot.
  ///
  /// Every row is decoded before the transaction starts. This means malformed
  /// data fails without deleting anything, and the transaction prevents a
  /// partially restored database if an insert fails.
  Future<ImportSummary> importFromJson(File file) async {
    final decoded = jsonDecode(await file.readAsString());
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('The selected file is not a JSON object.');
    }

    final rows = _decodeRows(decoded);

    await _db.transaction(() async {
      // Delete children first so this also works when foreign-key enforcement
      // is enabled by a future SQLite configuration.
      for (final table in _db.allTables.toList().reversed) {
        await _db.delete(table).go();
      }

      // Insert parents before their dependent rows.
      await _insertAll(_db.decisions, rows.decisions);
      await _insertAll(_db.goals, rows.goals);
      await _insertAll(_db.assumptions, rows.assumptions);
      await _insertAll(_db.entities, rows.entities);
      await _insertAll(_db.decisionVersions, rows.decisionVersions);
      await _insertAll(_db.decisionRisks, rows.decisionRisks);
      await _insertAll(_db.decisionAdvice, rows.decisionAdvice);
      await _insertAll(_db.decisionReviews, rows.decisionReviews);
      await _insertAll(_db.goalVersions, rows.goalVersions);
      await _insertAll(_db.goalCheckins, rows.goalCheckins);
      await _insertAll(_db.reviewSchedules, rows.reviewSchedules);
      await _insertAll(_db.relations, rows.relations);
      await _insertAll(_db.events, rows.events);
      await _insertAll(_db.reflections, rows.reflections);
      await _insertAll(_db.projectEntries, rows.projectEntries);
      await _insertAll(_db.projectEntryEvidence, rows.projectEntryEvidence);
      await _insertAll(_db.projectReviewEntries, rows.projectReviewEntries);
    });

    return ImportSummary(rows.total);
  }

  Future<void> deleteAllData() async {
    for (final table in _db.allTables) {
      await _db.delete(table).go();
    }
  }

  _ImportRows _decodeRows(Map<String, dynamic> payload) {
    final formatVersion = payload['format_version'];
    if (formatVersion != null && formatVersion != 1 && formatVersion != 2) {
      throw FormatException(
        'Unsupported export format version: $formatVersion',
      );
    }

    List<Map<String, dynamic>> listFor(String key) {
      final value = payload[key];
      if (value == null) return const [];
      if (value is! List) {
        throw FormatException('"$key" must be an array.');
      }
      return value.map((row) {
        if (row is! Map) {
          throw FormatException('Every item in "$key" must be an object.');
        }
        return Map<String, dynamic>.from(row);
      }).toList();
    }

    T decode<T>(
      String key,
      Map<String, dynamic> row,
      T Function(Map<String, dynamic>) fromJson,
    ) {
      try {
        return fromJson(row);
      } on Object catch (error) {
        throw FormatException('Invalid row in "$key": $error');
      }
    }

    List<T> decodeList<T>(
      String key,
      T Function(Map<String, dynamic>) fromJson,
    ) => listFor(key).map((row) => decode(key, row, fromJson)).toList();

    return _ImportRows(
      decisions: decodeList('decisions', Decision.fromJson),
      decisionVersions: decodeList(
        'decision_versions',
        DecisionVersion.fromJson,
      ),
      assumptions: decodeList('assumptions', Assumption.fromJson),
      decisionRisks: decodeList('decision_risks', DecisionRisk.fromJson),
      decisionAdvice: decodeList(
        'decision_advice',
        DecisionAdviceData.fromJson,
      ),
      decisionReviews: decodeList('decision_reviews', DecisionReview.fromJson),
      goals: _orderGoals(decodeList('goals', Goal.fromJson)),
      goalVersions: decodeList('goal_versions', GoalVersion.fromJson),
      goalCheckins: decodeList('goal_checkins', GoalCheckin.fromJson),
      reviewSchedules: decodeList('review_schedules', ReviewSchedule.fromJson),
      entities: decodeList('entities', Entity.fromJson),
      relations: decodeList('relations', Relation.fromJson),
      events: decodeList('events', Event.fromJson),
      reflections: decodeList('reflections', Reflection.fromJson),
      projectEntries: decodeList('project_entries', ProjectEntry.fromJson),
      projectEntryEvidence: decodeList(
        'project_entry_evidence',
        ProjectEntryEvidenceData.fromJson,
      ),
      projectReviewEntries: decodeList(
        'project_review_entries',
        ProjectReviewEntry.fromJson,
      ),
    );
  }

  List<Goal> _orderGoals(List<Goal> goals) {
    final byId = {for (final goal in goals) goal.id: goal};
    final remaining = [...goals];
    final ordered = <Goal>[];
    while (remaining.isNotEmpty) {
      final ready = remaining.where((goal) {
        final parentId = goal.parentGoalId;
        return parentId == null ||
            !remaining.any((item) => item.id == parentId);
      }).toList();
      if (ready.isEmpty) {
        throw const FormatException('Goals contain a parent cycle.');
      }
      ordered.addAll(ready);
      remaining.removeWhere(ready.contains);
    }
    // Keep this explicit lookup so a missing parent remains a database-level
    // validation error during the transaction rather than being rewritten.
    for (final goal in ordered) {
      if (goal.parentGoalId != null && !byId.containsKey(goal.parentGoalId)) {
        throw FormatException('Goal ${goal.id} references a missing parent.');
      }
    }
    return ordered;
  }

  Future<void> _insertAll<T extends Table, D>(
    TableInfo<T, D> table,
    List<D> rows,
  ) async {
    for (final row in rows) {
      await _db.into(table).insert(row as Insertable<D>);
    }
  }
}

class ImportSummary {
  const ImportSummary(this.rowCount);

  final int rowCount;
}

class _ImportRows {
  const _ImportRows({
    required this.decisions,
    required this.decisionVersions,
    required this.assumptions,
    required this.decisionRisks,
    required this.decisionAdvice,
    required this.decisionReviews,
    required this.goals,
    required this.goalVersions,
    required this.goalCheckins,
    required this.reviewSchedules,
    required this.entities,
    required this.relations,
    required this.events,
    required this.reflections,
    required this.projectEntries,
    required this.projectEntryEvidence,
    required this.projectReviewEntries,
  });

  final List<Decision> decisions;
  final List<DecisionVersion> decisionVersions;
  final List<Assumption> assumptions;
  final List<DecisionRisk> decisionRisks;
  final List<DecisionAdviceData> decisionAdvice;
  final List<DecisionReview> decisionReviews;
  final List<Goal> goals;
  final List<GoalVersion> goalVersions;
  final List<GoalCheckin> goalCheckins;
  final List<ReviewSchedule> reviewSchedules;
  final List<Entity> entities;
  final List<Relation> relations;
  final List<Event> events;
  final List<Reflection> reflections;
  final List<ProjectEntry> projectEntries;
  final List<ProjectEntryEvidenceData> projectEntryEvidence;
  final List<ProjectReviewEntry> projectReviewEntries;

  int get total =>
      decisions.length +
      decisionVersions.length +
      assumptions.length +
      decisionRisks.length +
      decisionAdvice.length +
      decisionReviews.length +
      goals.length +
      goalVersions.length +
      goalCheckins.length +
      reviewSchedules.length +
      entities.length +
      relations.length +
      events.length +
      reflections.length +
      projectEntries.length +
      projectEntryEvidence.length +
      projectReviewEntries.length;
}
