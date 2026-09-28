import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

class ReviewsScreen extends ConsumerWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: StreamBuilder<List<ReviewSchedule>>(
        stream: db.schedulesDao.watchOverdue(),
        builder: (context, overdueSnap) {
          return StreamBuilder<List<ReviewSchedule>>(
            stream: db.schedulesDao.watchDueToday(),
            builder: (context, dueSnap) {
              final all = [...(overdueSnap.data ?? []), ...(dueSnap.data ?? [])];
              if (all.isEmpty) {
                return const Center(child: Text('Nothing due right now.'));
              }
              return ListView(
                children: all
                    .map((s) => StreamBuilder<Decision?>(
                          stream: s.decisionId != null
                              ? db.decisionsDao.getById(s.decisionId!).asStream()
                              : const Stream.empty(),
                          builder: (context, decSnap) => ListTile(
                            title: Text(decSnap.data?.title ?? s.kind),
                            subtitle: Text('${s.kind} · due ${s.nextDueAt}'),
                            onTap: () => context.go('/reviews/${s.id}'),
                          ),
                        ))
                    .toList(),
              );
            },
          );
        },
      ),
    );
  }
}
