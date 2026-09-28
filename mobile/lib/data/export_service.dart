import 'dart:convert';
import 'dart:io';

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

  Future<void> deleteAllData() async {
    for (final table in _db.allTables) {
      await _db.delete(table).go();
    }
  }
}
