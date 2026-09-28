import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

class GoalDetailScreen extends ConsumerWidget {
  const GoalDetailScreen({super.key, required this.goalId});

  final String goalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Goal')),
      body: StreamBuilder<List<Goal>>(
        stream: db.goalsDao.watchAll(),
        builder: (context, snap) {
          final goal = (snap.data ?? []).where((g) => g.id == goalId).firstOrNull;
          if (goal == null) return const Center(child: CircularProgressIndicator());
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(goal.title, style: Theme.of(context).textTheme.titleLarge),
              if (goal.why != null && goal.why!.isNotEmpty) Text(goal.why!),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text(goal.status)),
                  Chip(label: Text(goal.horizon)),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'active', label: Text('Active')),
                    ButtonSegment(value: 'paused', label: Text('Paused')),
                    ButtonSegment(value: 'achieved', label: Text('Achieved')),
                    ButtonSegment(value: 'abandoned', label: Text('Abandoned')),
                  ],
                  selected: {goal.status},
                  onSelectionChanged: (selection) =>
                      _changeStatus(db, goal, selection.first),
                ),
              ),
              const SizedBox(height: 16),
              Text('Check-ins', style: Theme.of(context).textTheme.titleSmall),
              StreamBuilder<List<GoalCheckin>>(
                stream: db.goalsDao.watchCheckins(goalId),
                builder: (context, checkinSnap) {
                  final checkins = checkinSnap.data ?? [];
                  return Column(
                    children: [
                      for (final c in checkins)
                        ListTile(
                          dense: true,
                          title: Text(c.notes ?? '(no note)'),
                          subtitle: Text('${c.checkedAt.toLocal()}'.split(' ').first),
                        ),
                      TextButton.icon(
                        onPressed: () => _addCheckin(context, db, goal.id),
                        icon: const Icon(Icons.add),
                        label: const Text('Add check-in'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              Text('Version history', style: Theme.of(context).textTheme.titleSmall),
              StreamBuilder<List<GoalVersion>>(
                stream: db.goalsDao.watchVersions(goalId),
                builder: (context, verSnap) {
                  final versions = verSnap.data ?? [];
                  if (versions.isEmpty) {
                    return const ListTile(
                      dense: true,
                      title: Text('No prior versions'),
                    );
                  }
                  return Column(
                    children: versions
                        .map((v) => ListTile(
                              dense: true,
                              title: Text('v${v.versionNo}: ${v.snapshot['title']}'),
                              subtitle: Text('status was ${v.snapshot['status']}'),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _changeStatus(dynamic db, Goal goal, String newStatus) async {
    final snapshot = {'title': goal.title, 'status': goal.status};
    await db.goalsDao.updateWithVersion(
      goal.copyWith(status: newStatus, updatedAt: DateTime.now()),
      snapshot,
    );
  }

  Future<void> _addCheckin(BuildContext context, dynamic db, String goalId) async {
    final notesCtrl = TextEditingController();
    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Goal check-in'),
        content: TextField(
          controller: notesCtrl,
          decoration: const InputDecoration(labelText: 'Notes'),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              await db.goalsDao.insertCheckin(GoalCheckinsCompanion.insert(
                id: const Uuid().v4(),
                goalId: goalId,
                notes: Value(notesCtrl.text.trim()),
              ));
              if (dialogContext.mounted) Navigator.pop(dialogContext);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
