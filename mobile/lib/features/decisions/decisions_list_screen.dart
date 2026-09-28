import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

class DecisionsListScreen extends ConsumerWidget {
  const DecisionsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Decisions')),
      body: StreamBuilder<List<Decision>>(
        stream: db.decisionsDao.watchAll(),
        builder: (context, snapshot) {
          final decisions = snapshot.data ?? [];
          if (decisions.isEmpty) {
            return const Center(child: Text('No decisions captured yet.'));
          }
          return ListView.builder(
            itemCount: decisions.length,
            itemBuilder: (context, index) {
              final d = decisions[index];
              return ListTile(
                title: Text(d.title),
                subtitle: Text('${d.type} · ${d.status}'),
                trailing: d.importance != null
                    ? Chip(label: Text('P${d.importance}'))
                    : null,
                onTap: () => context.go('/decisions/${d.id}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/decisions/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
