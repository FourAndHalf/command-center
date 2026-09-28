import 'package:flutter/material.dart';

/// Design tokens straight from design/DESIGN.md ("Executive Command
/// Center"). Colors are the exact hex values from its front-matter; the
/// prose sections (Brand & Style, Components, etc.) drive how they're used
/// in design_tokens.dart / theme.dart and the screen widgets.
class AppColors {
  AppColors._();

  // Core surfaces
  static const surface = Color(0xFF131315);
  static const surfaceDim = Color(0xFF131315);
  static const surfaceBright = Color(0xFF39393B);
  static const surfaceContainerLowest = Color(0xFF0E0E10);
  static const surfaceContainerLow = Color(0xFF1C1B1D);
  static const surfaceContainer = Color(0xFF201F22);
  static const surfaceContainerHigh = Color(0xFF2A2A2C);
  static const surfaceContainerHighest = Color(0xFF353437);

  static const onSurface = Color(0xFFE5E1E4);
  static const onSurfaceVariant = Color(0xFFC8C5CB);
  static const outline = Color(0xFF919095);
  static const outlineVariant = Color(0xFF47464B);

  static const primary = Color(0xFFC8C5CA);
  static const onPrimary = Color(0xFF303033);
  static const primaryContainer = Color(0xFF18181B);
  static const onPrimaryContainer = Color(0xFF828184);

  static const secondary = Color(0xFFC6C6C7);
  static const onSecondary = Color(0xFF2F3131);
  static const secondaryContainer = Color(0xFF454747);
  static const onSecondaryContainer = Color(0xFFB4B5B5);

  static const error = Color(0xFFFFB4AB);
  static const onError = Color(0xFF690005);
  static const errorContainer = Color(0xFF93000A);
  static const onErrorContainer = Color(0xFFFFDAD6);

  // "Canvas" per DESIGN.md's Colors/Elevation prose — the deepest layer,
  // used for app backgrounds and inset containers (search fields, segmented
  // switchers), distinct from the lighter `surface` role above.
  static const canvas = Color(0xFF09090B);

  // Micro-state accents (DESIGN.md "Micro-State Accents"): withheld until a
  // state needs calling out.
  static const tripwireAmber = Color(0xFFF59E0B);
  static const resolvedEmerald = Color(0xFF10B981);
  static const calibrationIndigo = Color(0xFF6366F1);
}

/// Typography roles from DESIGN.md. Geist for headlines/labels/metrics,
/// Inter for body copy — mirrored into ThemeData.textTheme in theme.dart for
/// default widgets, and available directly here for the bespoke roles
/// (label-caps, mono-metric) Material's TextTheme has no slot for.
class AppTypography {
  AppTypography._();

  static const _geist = 'Geist';
  static const _inter = 'Inter';

  static const displayHero = TextStyle(
    fontFamily: _geist,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 44 / 36,
    letterSpacing: -0.03 * 36,
  );

  static const headlineLg = TextStyle(
    fontFamily: _geist,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.02 * 24,
  );

  static const headlineMd = TextStyle(
    fontFamily: _geist,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 28 / 20,
    letterSpacing: -0.02 * 20,
  );

  static const bodyLg = TextStyle(
    fontFamily: _inter,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
    letterSpacing: -0.01 * 18,
  );

  static const bodyMd = TextStyle(
    fontFamily: _inter,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 24 / 15,
  );

  static const bodySm = TextStyle(
    fontFamily: _inter,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 20 / 13,
  );

  /// Tabular figures for dates, percentages, and calibration scores.
  static const monoMetric = TextStyle(
    fontFamily: _geist,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 20 / 15,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  /// Uppercase micro-labels: category tags, tripwire/status indicators.
  static const labelCaps = TextStyle(
    fontFamily: _geist,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 16 / 11,
    letterSpacing: 0.08 * 11,
  );
}

/// Corner radii from DESIGN.md's Shapes section.
class AppRadius {
  AppRadius._();

  static const sm = 4.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const full = 9999.0;
}

/// 8pt spacing rhythm from DESIGN.md's Layout & Spacing section.
class AppSpacing {
  AppSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 40.0;
  static const gutterMobile = 16.0;
  static const marginMobile = 16.0;
}
