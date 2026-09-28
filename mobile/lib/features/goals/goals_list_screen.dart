import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

const horizons = [
  'this_month',
  'this_quarter',
  '1_year',
  '3_years',
  '5_years',
  '10_years',
  'open_ended',
];

const horizonLabels = {
  'this_month': 'This month',
  'this_quarter': 'This quarter',
  '1_year': '1 year',
  '3_years': '3 years',
  '5_years': '5 years',
  '10_years': '10 years',
  'open_ended': 'Open-ended (principles & values)',
};

class GoalsListScreen extends ConsumerWidget {
  const GoalsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Goals')),
      body: StreamBuilder<List<Goal>>(
        stream: db.goalsDao.watchAll(),
        builder: (context, snapshot) {
          final goals = snapshot.data ?? [];
          final byHorizon = <String, List<Goal>>{};
          for (final g in goals) {
            byHorizon.putIfAbsent(g.horizon, () => []).add(g);
          }
          return ListView(
            children: [
              for (final h in horizons)
                if (byHorizon[h]?.isNotEmpty ?? false) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: Text(
                      horizonLabels[h]!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  for (final g in byHorizon[h]!)
                    ListTile(
                      title: Text(g.title),
                      subtitle: Text(g.status),
                      onTap: () => context.go('/goals/${g.id}'),
                    ),
                ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createGoal(context, db),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _createGoal(BuildContext context, dynamic db) async {
    final titleCtrl = TextEditingController();
    final whyCtrl = TextEditingController();
    String horizon = '1_year';

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheetState) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Goal'),
              ),
              TextField(
                controller: whyCtrl,
                decoration: const InputDecoration(labelText: 'Why'),
              ),
              DropdownButtonFormField<String>(
                initialValue: horizon,
                items: horizons
                    .map((h) => DropdownMenuItem(
                        value: h, child: Text(horizonLabels[h]!)))
                    .toList(),
                onChanged: (v) => setSheetState(() => horizon = v!),
                decoration: const InputDecoration(labelText: 'Horizon'),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () async {
                  if (titleCtrl.text.trim().isEmpty) return;
                  await db.goalsDao.insertGoal(GoalsCompanion.insert(
                    id: const Uuid().v4(),
                    title: titleCtrl.text.trim(),
                    horizon: horizon,
                    why: Value(whyCtrl.text.trim()),
                  ));
                  if (sheetContext.mounted) Navigator.pop(sheetContext);
                },
                child: const Text('Save goal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
