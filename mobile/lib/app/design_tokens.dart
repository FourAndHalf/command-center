import 'package:flutter/material.dart';

/// Design tokens straight from design/DESIGN.md ("Boro").
class AppColors {
  AppColors._();

  // Core surfaces
  static const surface = Color(0xFFFCF8F8);
  static const surfaceDim = Color(0xFFDCD9D9);
  static const surfaceBright = Color(0xFFFCF8F8);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF6F3F2);
  static const surfaceContainer = Color(0xFFF1EDEC);
  static const surfaceContainerHigh = Color(0xFFEBE7E7);
  static const surfaceContainerHighest = Color(0xFFE5E2E1);

  static const onSurface = Color(0xFF1C1B1B);
  static const onSurfaceVariant = Color(0xFF454558);
  static const outline = Color(0xFF757589);
  static const outlineVariant = Color(0xFFC5C4DB);

  static const primary = Color(0xFF0001BB);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF0000FF);
  static const onPrimaryContainer = Color(0xFFB3B7FF);

  static const secondary = Color(0xFF5A5F66);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFDBE0E8);
  static const onSecondaryContainer = Color(0xFF5E636A);

  static const tertiary = Color(0xFF333637);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFF4A4C4E);
  static const onTertiaryContainer = Color(0xFFBBBCBE);

  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);
  static const primaryFixed = Color(0xFFE0E0FF);
  static const primaryFixedDim = Color(0xFFBEC2FF);
  static const inverseSurface = Color(0xFF313030);
  static const inverseOnSurface = Color(0xFFF3F0EF);

  static const canvas = surface;

  // Micro-state accents (DESIGN.md "Micro-State Accents"): withheld until a
  // state needs calling out.
  static const tripwireAmber = Color(0xFF9A6700);
  static const resolvedEmerald = Color(0xFF176B45);
  static const calibrationIndigo = Color(0xFF0001BB);
}

/// Typography roles from DESIGN.md. Inter is used throughout for a precise,
/// neutral hierarchy — mirrored into ThemeData.textTheme in theme.dart for
/// default widgets, and available directly here for the bespoke roles
/// (label-caps, mono-metric) Material's TextTheme has no slot for.
class AppTypography {
  AppTypography._();

  static const _inter = 'Inter';

  static const displayHero = TextStyle(
    fontFamily: _inter,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 44 / 36,
    letterSpacing: -0.03 * 36,
  );

  static const headlineLg = TextStyle(
    fontFamily: _inter,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.02 * 24,
  );

  static const headlineMd = TextStyle(
    fontFamily: _inter,
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
    fontFamily: _inter,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 20 / 15,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  /// Uppercase micro-labels: category tags, tripwire/status indicators.
  static const labelCaps = TextStyle(
    fontFamily: _inter,
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
  static const gutterMobile = 24.0;
  static const marginMobile = 24.0;
}
