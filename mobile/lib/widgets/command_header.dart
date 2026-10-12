import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../app/design_tokens.dart';
import '../app/providers.dart';
import 'command_center_mark.dart';

/// Branded header shared by every page. The selected product icon remains the
/// visual anchor while the title and actions inherit the active theme.
class CommandHeader extends ConsumerWidget implements PreferredSizeWidget {
  const CommandHeader({
    super.key,
    required this.title,
    this.onCapture,
    this.onDelete,
  });

  final String title;
  final VoidCallback? onCapture;
  final VoidCallback? onDelete;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;
    final scheme = Theme.of(context).colorScheme;
    return AppBar(
      titleSpacing: AppSpacing.marginMobile,
      title: Row(
        children: [
          SizedBox(
            width: 34,
            height: 34,
            child: Semantics(
              label: 'Command Center',
              image: true,
              child: CommandCenterMark(size: 34),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: AppTypography.headlineMd.copyWith(
                fontSize: 22,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        if (onDelete != null)
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 21),
            tooltip: 'Delete project',
            onPressed: onDelete,
          ),
        if (onCapture != null)
          IconButton(
            icon: const Icon(Icons.add, size: 21),
            style: IconButton.styleFrom(
              backgroundColor: scheme.primaryContainer,
              foregroundColor: scheme.onPrimaryContainer,
              shape: const StadiumBorder(),
            ),
            onPressed: onCapture,
          ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
          tooltip: isDark ? 'Use light mode' : 'Use dark mode',
          onPressed: () => ref.read(themeModeProvider.notifier).state = isDark
              ? ThemeMode.light
              : ThemeMode.dark,
        ),
        IconButton(
          icon: const Icon(Icons.tune, size: 20),
          tooltip: 'Settings',
          onPressed: () => context.push('/settings'),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
