import 'package:flutter/material.dart';

import '../app/design_tokens.dart';

/// The compact metric tiles used across Today/Decisions/Goals/Reviews
/// (design/DESIGN.md dense stat rows): a label-caps heading, a large
/// mono-metric value, and a small sublabel underneath.
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.label,
    required this.value,
    required this.sublabel,
    this.accent,
    this.trailingIcon,
  });

  final String label;
  final String value;
  final String sublabel;
  final Color? accent;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final valueColor = accent ?? AppColors.onSurface;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: AppTypography.labelCaps.copyWith(
                    color: accent ?? AppColors.outline,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (trailingIcon != null)
                Icon(trailingIcon, size: 14, color: accent ?? AppColors.outline),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTypography.headlineLg.copyWith(color: valueColor, fontSize: 26),
          ),
          const SizedBox(height: 2),
          Text(
            sublabel.toUpperCase(),
            style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
          ),
        ],
      ),
    );
  }
}
