import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

/// "What deserves my attention right now?" (docs/prompt.md §15): reviews
/// due, overdue reviews, active decisions, upcoming, and unresolved items
/// (pending decisions near decide_by, cool-off revisits, reflections due).
class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Today')),
      body: StreamBuilder<List<ReviewSchedule>>(
        stream: db.schedulesDao.watchDueToday(),
        builder: (context, dueSnap) {
          return StreamBuilder<List<ReviewSchedule>>(
            stream: db.schedulesDao.watchOverdue(),
            builder: (context, overdueSnap) {
              return StreamBuilder<List<ReviewSchedule>>(
                stream: db.schedulesDao.watchUpcoming(),
                builder: (context, upcomingSnap) {
                  return StreamBuilder<List<Decision>>(
                    stream: db.decisionsDao.watchByStatus('active'),
                    builder: (context, activeSnap) {
                      return StreamBuilder<List<Decision>>(
                        stream: db.decisionsDao.watchByStatus('pending'),
                        builder: (context, pendingSnap) {
                          return ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              _section(
                                context,
                                'Overdue reviews',
                                overdueSnap.data ?? [],
                                (s) => _scheduleTile(context, s),
                              ),
                              _section(
                                context,
                                'Reviews due',
                                dueSnap.data ?? [],
                                (s) => _scheduleTile(context, s),
                              ),
                              _section(
                                context,
                                'Active decisions',
                                activeSnap.data ?? [],
                                (d) => ListTile(
                                  title: Text(d.title),
                                  subtitle: Text(d.type),
                                  onTap: () => context.go('/decisions/${d.id}'),
                                ),
                              ),
                              _section(
                                context,
                                'Upcoming',
                                upcomingSnap.data ?? [],
                                (s) => _scheduleTile(context, s),
                              ),
                              _section(
                                context,
                                'Unresolved (pending decisions)',
                                pendingSnap.data ?? [],
                                (d) => ListTile(
                                  title: Text(d.title),
                                  subtitle: d.decideBy != null
                                      ? Text('Decide by ${_fmt(d.decideBy!)}')
                                      : null,
                                  onTap: () => context.go('/decisions/${d.id}'),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/decisions/new'),
        icon: const Icon(Icons.add),
        label: const Text('Capture decision'),
      ),
    );
  }

  Widget _scheduleTile(BuildContext context, ReviewSchedule s) {
    return ListTile(
      leading: Icon(_iconFor(s.kind)),
      title: Text(_labelFor(s.kind)),
      subtitle: s.nextDueAt != null ? Text('Due ${_fmt(s.nextDueAt!)}') : null,
      onTap: () => context.go('/reviews/${s.id}'),
    );
  }

  IconData _iconFor(String kind) {
    switch (kind) {
      case 'tripwire':
        return Icons.warning_amber_outlined;
      case 'cooloff':
        return Icons.hourglass_bottom;
      case 'decide_by':
        return Icons.event_available;
      case 'reflection':
        return Icons.auto_stories_outlined;
      default:
        return Icons.rate_review_outlined;
    }
  }

  String _labelFor(String kind) {
    switch (kind) {
      case 'tripwire':
        return 'Tripwire check';
      case 'cooloff':
        return 'Cool-off revisit';
      case 'decide_by':
        return 'Decide-by reminder';
      case 'reflection':
        return 'Reflection due';
      default:
        return 'Review';
    }
  }

  String _fmt(DateTime d) => '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Widget _section<T>(
    BuildContext context,
    String title,
    List<T> items,
    Widget Function(T) tile,
  ) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        ...items.map(tile),
      ],
    );
  }
}
