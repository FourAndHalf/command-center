import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers.dart';

/// Primary bottom navigation: Today · Decisions · Goals · Reviews · More.
/// "More" opens the secondary areas (Timeline, Search, Insights, People,
/// Reflection, Settings) via a bottom sheet, matching the primary/secondary
/// split in docs/prompt.md §14 adapted to a phone-sized tab bar.
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const _tabs = ['/today', '/decisions', '/goals', '/reviews'];

  int _indexForLocation(String location) {
    for (var i = 0; i < _tabs.length; i++) {
      if (location.startsWith(_tabs[i])) return i;
    }
    return -1; // one of the "More" destinations
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexForLocation(location);
    final db = ref.watch(databaseProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: StreamBuilder<int>(
        stream: _dueAndOverdueCount(db),
        builder: (context, countSnap) {
          final count = countSnap.data ?? 0;
          return NavigationBar(
            selectedIndex: currentIndex < 0 ? 0 : currentIndex,
            onDestinationSelected: (index) {
              if (index == 4) {
                _showMoreSheet(context);
                return;
              }
              context.go(_tabs[index]);
            },
            destinations: [
              const NavigationDestination(icon: Icon(Icons.today), label: 'Today'),
              const NavigationDestination(
                icon: Icon(Icons.fact_check_outlined),
                label: 'Decisions',
              ),
              const NavigationDestination(
                icon: Icon(Icons.flag_outlined),
                label: 'Goals',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: count > 0,
                  label: Text('$count'),
                  child: const Icon(Icons.rate_review_outlined),
                ),
                label: 'Reviews',
              ),
              const NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More'),
            ],
          );
        },
      ),
    );
  }

  Stream<int> _dueAndOverdueCount(dynamic db) {
    return db.schedulesDao.watchDueToday().asyncMap((due) async {
      final overdue = await db.schedulesDao.watchOverdue().first;
      return (due.length as int) + (overdue.length as int);
    });
  }

  void _showMoreSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Wrap(
          children: [
            _moreTile(sheetContext, Icons.timeline, 'Timeline', '/timeline'),
            _moreTile(sheetContext, Icons.search, 'Search', '/search'),
            _moreTile(sheetContext, Icons.insights, 'Insights', '/insights'),
            _moreTile(sheetContext, Icons.people_outline, 'People', '/people'),
            _moreTile(
              sheetContext,
              Icons.auto_stories_outlined,
              'Reflection',
              '/reflection',
            ),
            _moreTile(
              sheetContext,
              Icons.settings_outlined,
              'Settings',
              '/settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _moreTile(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
    );
  }
}
