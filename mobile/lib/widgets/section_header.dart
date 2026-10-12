import 'package:flutter/material.dart';

import '../app/design_tokens.dart';

/// A section title with an optional colored leading rule and a trailing
/// badge/label, matching the "Overdue Reviews · ACTION REQUIRED" style
/// section headers in the mockups.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.accent,
    this.icon,
  });

  final String title;
  final Widget? trailing;
  final Color? accent;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: AppSpacing.sm),
      child: Row(
        children: [
          if (accent != null) ...[
            Container(width: 3, height: 16, color: accent),
            const SizedBox(width: 8),
          ] else if (icon != null) ...[
            Icon(icon, size: 16, color: scheme.onSurfaceVariant),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              style: AppTypography.headlineMd.copyWith(
                fontSize: 17,
                color: scheme.onSurface,
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
