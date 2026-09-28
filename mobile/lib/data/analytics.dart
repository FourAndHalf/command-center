import 'database.dart';

/// Small, honest analytics helpers shared by the Today header's
/// "Calibrated: X%" figure and the Insights screen (docs/prompt.md §8
/// "Calibration and patterns") — no AI, computed straight from recorded
/// assumptions, and traceable back to them.
class Analytics {
  Analytics(this.db);

  final AppDatabase db;

  Future<List<Assumption>> allAssumptions() async {
    final decisions = await db.decisionsDao.watchAll().first;
    final all = <Assumption>[];
    for (final d in decisions) {
      all.addAll(await db.decisionsDao.watchAssumptions(d.id).first);
    }
    return all;
  }

  /// Fraction of tested assumptions ('supported' or 'contradicted') that
  /// came out supported. Null when nothing has been tested yet — there is
  /// no calibration figure to show, so callers should say so rather than
  /// show a fabricated 0%.
  Future<double?> overallCalibration() async {
    final assumptions = await allAssumptions();
    final tested = assumptions
        .where((a) => a.validationStatus != 'untested')
        .toList();
    if (tested.isEmpty) return null;
    final held = tested.where((a) => a.validationStatus == 'supported').length;
    return held / tested.length;
  }
}
