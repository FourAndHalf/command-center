import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../data/database.dart';

/// Single shared database instance for the whole app.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// App-wide appearance preference. Dark mode is the default and the setting
/// is intentionally owned above the router so every destination updates at
/// once when the user taps the sun/moon control.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

class AiReviewSettings {
  const AiReviewSettings({this.apiKey = '', this.model = 'gpt-5-mini'});

  final String apiKey;
  final String model;
}

/// Session-only AI configuration. The key is intentionally not persisted,
/// exported, logged, or included in database records.
final aiReviewSettingsProvider = StateProvider<AiReviewSettings>(
  (ref) => const AiReviewSettings(),
);
