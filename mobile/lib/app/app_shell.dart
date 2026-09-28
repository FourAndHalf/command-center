import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Primary bottom navigation: Today · Decisions · Goals · Reviews · More.
/// "More" opens the secondary areas (Timeline, Search, Insights, People,
/// Reflection, Settings) via a bottom sheet, matching the primary/secondary
/// split in docs/prompt.md §14 adapted to a phone-sized tab bar.
class AppShell extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexForLocation(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex < 0 ? 0 : currentIndex,
        onDestinationSelected: (index) {
          if (index == 4) {
            _showMoreSheet(context);
            return;
          }
          context.go(_tabs[index]);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.today), label: 'Today'),
          NavigationDestination(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Decisions',
          ),
          NavigationDestination(icon: Icon(Icons.flag_outlined), label: 'Goals'),
          NavigationDestination(
            icon: Icon(Icons.rate_review_outlined),
            label: 'Reviews',
          ),
          NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
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
