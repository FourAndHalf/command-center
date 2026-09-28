import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';

/// Simple LIKE-based search across decisions, goals, and events. Every
/// result shows which record it came from (docs/prompt.md §18 provenance).
/// A SQLite FTS5 virtual table is the planned upgrade for ranking/relevance
/// once the core loop is proven out — this is a query-time concern only, so
/// swapping it in later does not touch the stored schema.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search decisions, goals, events...',
            border: InputBorder.none,
          ),
          onChanged: (v) => setState(() => _query = v.trim()),
        ),
      ),
      body: _query.isEmpty
          ? const Center(child: Text('Type to search your history.'))
          : FutureBuilder<List<Widget>>(
              future: _search(db, _query),
              builder: (context, snapshot) {
                final results = snapshot.data ?? [];
                if (results.isEmpty) {
                  return const Center(child: Text('No matches.'));
                }
                return ListView(children: results);
              },
            ),
    );
  }

  Future<List<Widget>> _search(dynamic db, String query) async {
    final pattern = '%$query%';

    final decisions = await (db.select(db.decisions)
          ..where((d) =>
              d.title.like(pattern) |
              d.objective.like(pattern) |
              d.context.like(pattern)))
        .get();

    final goals = await (db.select(db.goals)
          ..where((g) => g.title.like(pattern) | g.why.like(pattern)))
        .get();

    final events = await (db.select(db.events)
          ..where((e) => e.title.like(pattern) | e.description.like(pattern)))
        .get();

    final reviews = await (db.select(db.decisionReviews)
          ..where((r) => r.lesson.like(pattern) | r.whatActuallyHappened.like(pattern)))
        .get();

    return [
      for (final d in decisions)
        ListTile(
          leading: const Icon(Icons.fact_check_outlined),
          title: Text(d.title),
          subtitle: const Text('Decision'),
        ),
      for (final g in goals)
        ListTile(
          leading: const Icon(Icons.flag_outlined),
          title: Text(g.title),
          subtitle: const Text('Goal'),
        ),
      for (final e in events)
        ListTile(
          leading: const Icon(Icons.event_outlined),
          title: Text(e.title),
          subtitle: const Text('Event'),
        ),
      for (final r in reviews)
        ListTile(
          leading: const Icon(Icons.rate_review_outlined),
          title: Text(r.lesson ?? r.whatActuallyHappened ?? ''),
          subtitle: const Text('Review'),
        ),
    ];
  }
}
