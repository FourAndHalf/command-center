import 'package:flutter/material.dart';

import '../app/design_tokens.dart';

/// The small uppercase status pills used throughout the design
/// (design/DESIGN.md "Badges & Calibration Chips"): neutral zinc by
/// default, colored only when a state needs calling out.
enum BadgeTone { neutral, tripwire, resolved, critical, calibration }

class StatusBadge extends StatelessWidget {
  const StatusBadge(this.label, {super.key, this.tone = BadgeTone.neutral});

  final String label;
  final BadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final (fg, bg, border) = switch (tone) {
      BadgeTone.neutral => (
          AppColors.onSurfaceVariant,
          AppColors.surfaceContainerHigh,
          AppColors.outlineVariant,
        ),
      BadgeTone.tripwire => (
          AppColors.tripwireAmber,
          AppColors.tripwireAmber.withValues(alpha: 0.1),
          AppColors.tripwireAmber.withValues(alpha: 0.25),
        ),
      BadgeTone.resolved => (
          AppColors.resolvedEmerald,
          AppColors.resolvedEmerald.withValues(alpha: 0.1),
          AppColors.resolvedEmerald.withValues(alpha: 0.2),
        ),
      BadgeTone.critical => (
          AppColors.error,
          AppColors.error.withValues(alpha: 0.1),
          AppColors.error.withValues(alpha: 0.25),
        ),
      BadgeTone.calibration => (
          AppColors.calibrationIndigo,
          AppColors.calibrationIndigo.withValues(alpha: 0.12),
          AppColors.calibrationIndigo.withValues(alpha: 0.25),
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: border),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTypography.labelCaps.copyWith(color: fg),
      ),
    );
  }
}
