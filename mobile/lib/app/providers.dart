import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';

/// Single shared database instance for the whole app.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
