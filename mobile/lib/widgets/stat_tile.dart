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
    final scheme = Theme.of(context).colorScheme;
    final valueColor = accent ?? scheme.onSurface;

    return Container(
      height: 112,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: scheme.surfaceContainerHigh),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              child: _content(valueColor, scheme),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(Color valueColor, ColorScheme scheme) {
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
                  color: accent ?? scheme.outline,
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
                      color: accent ?? scheme.outline,
                    ),
            ),
          ],
        ),
        Text(
          value,
          style: AppTypography.displayHero.copyWith(
            color: valueColor,
            fontSize: 30,
            height: 1,
          ),
        ),
        Text(
          sublabel.toUpperCase(),
          style: AppTypography.labelCaps.copyWith(color: scheme.outline),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
