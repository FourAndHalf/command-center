import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/design_tokens.dart';
import 'status_badge.dart';

/// The "COMMAND [ACTIVE] / [screen name]" header row at the top of every
/// primary screen (design/DESIGN.md mockups), with a capture shortcut and a
/// link to Settings via the app mark.
class CommandHeader extends StatelessWidget implements PreferredSizeWidget {
  const CommandHeader({super.key, required this.title, this.onCapture});

  final String title;
  final VoidCallback? onCapture;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: AppSpacing.marginMobile,
      title: Row(
        children: [
          Text('COMMAND', style: AppTypography.headlineMd.copyWith(fontSize: 16)),
          const SizedBox(width: 8),
          const StatusBadge('Active'),
          const SizedBox(width: 8),
          Text('/', style: AppTypography.bodyMd.copyWith(color: AppColors.outline)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        if (onCapture != null)
          IconButton(
            icon: const Icon(Icons.add),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surfaceContainerHigh,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.sm * 2),
              ),
            ),
            onPressed: onCapture,
          ),
        const SizedBox(width: 8),
        IconButton(
          icon: Image.asset('assets/icon/splash_logo.png'),
          tooltip: 'Settings',
          onPressed: () => context.push('/settings'),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
