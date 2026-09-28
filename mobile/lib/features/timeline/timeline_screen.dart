import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

class _TimelineItem {
  _TimelineItem(this.date, this.label, this.subtitle);
  final DateTime date;
  final String label;
  final String subtitle;
}

/// Chronological life timeline merging events, decisions, and reviews
/// (docs/prompt.md §17). Filtering by type/date/entity/importance is a
/// follow-up once this base list is in place.
class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Timeline')),
      body: StreamBuilder<List<Decision>>(
        stream: db.decisionsDao.watchAll(),
        builder: (context, decSnap) {
          return StreamBuilder<List<Event>>(
            stream: db.entitiesDao.watchAllEvents(),
            builder: (context, eventSnap) {
              final items = <_TimelineItem>[
                for (final d in decSnap.data ?? [])
                  _TimelineItem(
                    d.decisionAt ?? d.createdAt,
                    'Decision: ${d.title}',
                    d.type,
                  ),
                for (final e in eventSnap.data ?? [])
                  _TimelineItem(e.occurredAt, 'Event: ${e.title}', e.type ?? ''),
              ]..sort((a, b) => b.date.compareTo(a.date));

              if (items.isEmpty) {
                return const Center(child: Text('Nothing recorded yet.'));
              }
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) => ListTile(
                  title: Text(items[i].label),
                  subtitle: Text(items[i].subtitle),
                  trailing: Text('${items[i].date}'.split(' ').first),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
