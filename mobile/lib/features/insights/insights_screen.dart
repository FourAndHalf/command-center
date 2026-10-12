import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../data/database.dart';
import '../../widgets/command_header.dart';

/// Prediction calibration and life-area counts (docs/prompt.md §8), computed
/// live from local records — no AI, no server, every number traceable back
/// to a decision or assumption.
class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: const CommandHeader(title: 'Insights'),
      body: StreamBuilder<List<Decision>>(
        stream: db.decisionsDao.watchAll(),
        builder: (context, decSnap) {
          final decisions = decSnap.data ?? [];
          return FutureBuilder<List<Assumption>>(
            future: _allAssumptions(db, decisions),
            builder: (context, assumptionSnap) {
              final assumptions = assumptionSnap.data ?? [];
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Life-area counts',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ..._lifeAreaCounts(decisions),
                  const SizedBox(height: 24),
                  Text('Prediction calibration',
                      style: Theme.of(context).textTheme.titleMedium),
                  const Text(
                    'Compares recorded confidence against how assumptions '
                    'turned out. Measures predictions, not decision quality.',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  ..._calibration(assumptions),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Assumption>> _allAssumptions(
      dynamic db, List<Decision> decisions) async {
    final all = <Assumption>[];
    for (final d in decisions) {
      all.addAll(await db.decisionsDao.watchAssumptions(d.id).first);
    }
    return all;
  }

  List<Widget> _lifeAreaCounts(List<Decision> decisions) {
    final counts = <String, int>{};
    for (final d in decisions) {
      counts[d.type] = (counts[d.type] ?? 0) + 1;
    }
    if (counts.isEmpty) return [const Text('No decisions recorded yet.')];
    return counts.entries
        .map((e) => ListTile(
              dense: true,
              title: Text(e.key),
              trailing: Text('${e.value}'),
            ))
        .toList();
  }

  List<Widget> _calibration(List<Assumption> assumptions) {
    // Bucket by confidence decile; compare against validation_status.
    final buckets = <int, List<Assumption>>{};
    for (final a in assumptions) {
      if (a.confidence == null || a.validationStatus == 'untested') continue;
      final bucket = (a.confidence! ~/ 10) * 10;
      buckets.putIfAbsent(bucket, () => []).add(a);
    }
    if (buckets.isEmpty) {
      return [const Text('Review some assumptions to see calibration here.')];
    }
    final sortedKeys = buckets.keys.toList()..sort();
    return sortedKeys.map((bucket) {
      final items = buckets[bucket]!;
      final held = items.where((a) => a.validationStatus == 'supported').length;
      return ListTile(
        dense: true,
        title: Text('Confidence ~$bucket%'),
        trailing: Text('$held / ${items.length} held'),
      );
    }).toList();
  }
}
