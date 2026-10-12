import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'app/providers.dart';

void main() {
  runApp(const ProviderScope(child: CommandCenterApp()));
}

class CommandCenterApp extends ConsumerWidget {
  const CommandCenterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'Command Center',
      theme: buildAppTheme(),
      darkTheme: buildAppTheme(dark: true),
      themeMode: mode,
      routerConfig: appRouter,
    );
  }
}
