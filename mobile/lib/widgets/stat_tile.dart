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

    // Fixed height + single-line text keeps every tile in a row identical
    // regardless of label length or whether it has an icon.
    return Container(
      height: 104,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        children: [
          // Thin top rule gives each tile a defined edge.
          Container(height: 2, color: accent ?? AppColors.outlineVariant),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md - 4,
                vertical: AppSpacing.sm + 2,
              ),
              child: _content(valueColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              width: 16,
              height: 16,
              child: trailingIcon == null
                  ? null
                  : Icon(
                      trailingIcon,
                      size: 14,
                      color: accent ?? AppColors.outline,
                    ),
            ),
          ],
        ),
        Text(
          value,
          style: AppTypography.headlineLg.copyWith(
            color: valueColor,
            fontSize: 28,
          ),
        ),
        Text(
          sublabel.toUpperCase(),
          style: AppTypography.labelCaps.copyWith(color: AppColors.outline),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
