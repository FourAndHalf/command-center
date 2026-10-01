import 'package:drift/drift.dart' show BooleanExpressionOperators, StringExpressionOperators;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../data/database.dart';

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
  final _controller = SearchController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBar(
              controller: _controller,
              hintText: 'Search decisions, goals, events...',
              leading: const Icon(Icons.search),
              trailing: _query.isEmpty
                  ? null
                  : [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      ),
                    ],
              onChanged: (v) => setState(() => _query = v.trim()),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _query.isEmpty
                  ? const Center(child: Text('Type to search your history.'))
                  : FutureBuilder<List<Widget>>(
                      future: _search(context, db, _query),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text('Search failed: ${snapshot.error}'));
                        }
                        final results = snapshot.data ?? [];
                        if (results.isEmpty) {
                          return const Center(child: Text('No matches.'));
                        }
                        return ListView(children: results);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Widget>> _search(BuildContext context, AppDatabase db, String query) async {
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
        Card(
          child: ListTile(
            leading: const Icon(Icons.fact_check_outlined),
            title: Text(d.title),
            subtitle: const Text('Decision'),
            onTap: () => context.push('/decisions/${d.id}'),
          ),
        ),
      for (final g in goals)
        Card(
          child: ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: Text(g.title),
            subtitle: const Text('Goal'),
            onTap: () => context.push('/goals/${g.id}'),
          ),
        ),
      for (final e in events)
        Card(
          child: ListTile(
            leading: const Icon(Icons.event_outlined),
            title: Text(e.title),
            subtitle: const Text('Event'),
          ),
        ),
      for (final r in reviews)
        Card(
          child: ListTile(
            leading: const Icon(Icons.rate_review_outlined),
            title: Text(r.lesson ?? r.whatActuallyHappened ?? ''),
            subtitle: const Text('Review'),
            onTap: () => context.push('/decisions/${r.decisionId}'),
          ),
        ),
    ];
  }
}
