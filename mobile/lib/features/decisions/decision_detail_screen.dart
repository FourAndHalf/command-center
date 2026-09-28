import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' show Value;

import '../../app/providers.dart';
import '../../data/database.dart';

/// "Decision Replay" (docs/prompt.md §16): why / what I knew / believed /
/// felt / expected / what happened / reviews / related — the original
/// decision stays visually distinct from later reviews.
class DecisionDetailScreen extends ConsumerWidget {
  const DecisionDetailScreen({super.key, required this.decisionId});

  final String decisionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Decision')),
      body: StreamBuilder<Decision?>(
        stream: db.decisionsDao.getById(decisionId).asStream(),
        builder: (context, snapshot) {
          final decision = snapshot.data;
          if (decision == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        decision.title.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text('${decision.type} · ${decision.status}'),
                      if (decision.context != null &&
                          decision.context!.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        const Text('WHY', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(decision.context!),
                      ],
                      if (decision.expectedOutcome != null &&
                          decision.expectedOutcome!.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        const Text('WHAT I EXPECTED',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(decision.expectedOutcome!),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _assumptionsSection(db, context),
              const SizedBox(height: 16),
              _risksSection(db, context),
              const SizedBox(height: 16),
              _reviewsSection(db, context),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => _startAdHocReview(context, db),
                icon: const Icon(Icons.rate_review_outlined),
                label: const Text('Add a review now'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _assumptionsSection(dynamic db, BuildContext context) {
    return StreamBuilder<List<Assumption>>(
      stream: db.decisionsDao.watchAssumptions(decisionId),
      builder: (context, snap) {
        final items = snap.data ?? [];
        if (items.isEmpty) return const SizedBox.shrink();
        return _section(
          context,
          'WHAT I BELIEVED (assumptions)',
          items
              .map((a) => ListTile(
                    dense: true,
                    title: Text(a.statement),
                    subtitle: Text('${a.confidence ?? '?'}% · ${a.validationStatus}'),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _risksSection(dynamic db, BuildContext context) {
    return StreamBuilder<List<DecisionRisk>>(
      stream: db.decisionsDao.watchRisks(decisionId),
      builder: (context, snap) {
        final items = snap.data ?? [];
        if (items.isEmpty) return const SizedBox.shrink();
        return _section(
          context,
          'PRE-MORTEM RISKS',
          items
              .map((r) => ListTile(
                    dense: true,
                    title: Text(r.statement),
                    subtitle: r.happened == null
                        ? const Text('Not yet reviewed')
                        : Text(r.happened! ? 'Happened' : 'Did not happen'),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _reviewsSection(dynamic db, BuildContext context) {
    return StreamBuilder<List<DecisionReview>>(
      stream: db.reviewsDao.watchForDecision(decisionId),
      builder: (context, snap) {
        final items = snap.data ?? [];
        return _section(
          context,
          'REVIEWS',
          items.isEmpty
              ? [const ListTile(dense: true, title: Text('No reviews yet'))]
              : items
                  .map((r) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(r.whatActuallyHappened ?? '(no summary)'),
                          subtitle: Text(
                              '${r.reviewedAt.toLocal()}'.split(' ').first +
                                  (r.lesson != null ? ' — ${r.lesson}' : '')),
                        ),
                      ))
                  .toList(),
        );
      },
    );
  }

  Widget _section(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        ...children,
      ],
    );
  }

  Future<void> _startAdHocReview(BuildContext context, dynamic db) async {
    const uuid = Uuid();
    final scheduleId = uuid.v4();
    await db.schedulesDao.insertSchedule(ReviewSchedulesCompanion.insert(
      id: scheduleId,
      decisionId: Value(decisionId),
      triggerType: 'time',
      nextDueAt: Value(DateTime.now()),
    ));
    if (context.mounted) context.go('/reviews/$scheduleId');
  }
}
