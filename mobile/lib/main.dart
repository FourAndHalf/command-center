import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
import 'app/theme.dart';

void main() {
  runApp(const ProviderScope(child: CommandCenterApp()));
}

class CommandCenterApp extends StatelessWidget {
  const CommandCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The "Executive Command Center" design system (design/DESIGN.md) is a
    // single deliberately dark palette, not a light/dark pair, so the app
    // always renders in it regardless of the device's system theme.
    return MaterialApp.router(
      title: 'Command Center',
      theme: buildAppTheme(),
      darkTheme: buildAppTheme(),
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
    );
  }
}
