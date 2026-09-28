import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

/// Quarterly/yearly reflection (docs/prompt.md §10): a structured pass over
/// goals, decisions, reviews, and lessons for the period, saved as an
/// append-only record. Not free-form journaling.
class ReflectionScreen extends ConsumerWidget {
  const ReflectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Reflection')),
      body: StreamBuilder<List<Reflection>>(
        stream: db.select(db.reflections).watch(),
        builder: (context, snapshot) {
          final reflections = (snapshot.data ?? [])
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FilledButton.icon(
                onPressed: () => _createReflection(context, db, 'quarter'),
                icon: const Icon(Icons.auto_stories_outlined),
                label: const Text('New quarterly reflection'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => _createReflection(context, db, 'year'),
                icon: const Icon(Icons.auto_stories_outlined),
                label: const Text('New yearly reflection'),
              ),
              const SizedBox(height: 24),
              Text('Past reflections', style: Theme.of(context).textTheme.titleMedium),
              for (final r in reflections)
                Card(
                  child: ListTile(
                    title: Text(r.periodLabel),
                    subtitle: Text(
                        'Decisions: ${r.summary['decisions']}, '
                        'Reviews: ${r.summary['reviews']}, '
                        'Goals touched: ${r.summary['goals']}'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _createReflection(
      BuildContext context, dynamic db, String periodType) async {
    final now = DateTime.now();
    final quarterStartMonth = ((now.month - 1) ~/ 3) * 3 + 1;
    final start = periodType == 'year'
        ? DateTime(now.year, 1, 1)
        : DateTime(now.year, quarterStartMonth, 1);

    final decisions = await db.decisionsDao.watchAll().first;
    final periodDecisions =
        decisions.where((d) => d.createdAt.isAfter(start)).toList();

    var reviewCount = 0;
    final lessons = <String>[];
    for (final d in periodDecisions) {
      final reviews = await db.reviewsDao.watchForDecision(d.id).first;
      reviewCount += reviews.length as int;
      lessons.addAll(reviews.map((r) => r.lesson).whereType<String>());
    }

    final goals = await db.goalsDao.watchAll().first;
    final periodGoals = goals.where((g) => g.updatedAt.isAfter(start)).toList();

    final label = periodType == 'year'
        ? '${now.year}'
        : '${now.year}-Q${((now.month - 1) ~/ 3) + 1}';

    await db.into(db.reflections).insert(ReflectionsCompanion.insert(
          id: const Uuid().v4(),
          periodType: periodType,
          periodLabel: label,
          summary: {
            'decisions': periodDecisions.length,
            'reviews': reviewCount,
            'goals': periodGoals.length,
            'lessons': lessons,
          },
        ));

    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Reflection saved for $label')));
    }
  }
}
