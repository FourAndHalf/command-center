import 'package:flutter/material.dart';

import 'design_tokens.dart';

/// Builds the app's Material 3 [ThemeData] from the "Executive Command
/// Center" design system (design/DESIGN.md): a fixed dark zinc palette
/// (there is no separate light variant defined in that system), Geist for
/// headlines/labels/metrics, Inter for body copy, hairline borders instead
/// of drop shadows, and Level-2-rounded shapes.
ThemeData buildAppTheme() {
  const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    surfaceContainerLowest: AppColors.surfaceContainerLowest,
    surfaceContainerLow: AppColors.surfaceContainerLow,
    surfaceContainer: AppColors.surfaceContainer,
    surfaceContainerHigh: AppColors.surfaceContainerHigh,
    surfaceContainerHighest: AppColors.surfaceContainerHighest,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.calibrationIndigo,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.calibrationIndigo,
    onTertiaryContainer: Colors.white,
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    inversePrimary: AppColors.primary,
    inverseSurface: AppColors.onSurface,
    onInverseSurface: AppColors.surface,
    shadow: Colors.black,
    scrim: Colors.black,
    surfaceTint: Colors.transparent,
  );

  final textTheme = TextTheme(
    displayLarge: AppTypography.displayHero.copyWith(color: colorScheme.onSurface),
    headlineLarge: AppTypography.headlineLg.copyWith(color: colorScheme.onSurface),
    headlineMedium: AppTypography.headlineMd.copyWith(color: colorScheme.onSurface),
    titleLarge: AppTypography.headlineMd.copyWith(color: colorScheme.onSurface),
    titleMedium: AppTypography.headlineMd.copyWith(
      fontSize: 16,
      color: colorScheme.onSurface,
    ),
    titleSmall: AppTypography.labelCaps.copyWith(color: colorScheme.onSurfaceVariant),
    bodyLarge: AppTypography.bodyLg.copyWith(color: colorScheme.onSurface),
    bodyMedium: AppTypography.bodyMd.copyWith(color: colorScheme.onSurface),
    bodySmall: AppTypography.bodySm.copyWith(color: colorScheme.onSurfaceVariant),
    labelLarge: AppTypography.bodyMd.copyWith(
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    labelMedium: AppTypography.labelCaps.copyWith(color: colorScheme.onSurfaceVariant),
    labelSmall: AppTypography.labelCaps.copyWith(color: colorScheme.onSurfaceVariant),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.canvas,
    textTheme: textTheme,
    fontFamily: 'Inter',

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.canvas,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceContainerLow,
      indicatorColor: AppColors.surfaceContainerHigh,
      surfaceTintColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return AppTypography.labelCaps.copyWith(
          color: selected ? AppColors.onSurface : AppColors.outline,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? AppColors.onSurface : AppColors.outline,
        );
      }),
    ),

    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceContainerHigh,
      side: const BorderSide(color: AppColors.outlineVariant),
      labelStyle: AppTypography.labelCaps.copyWith(color: colorScheme.onSurfaceVariant),
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primaryContainer,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
        borderSide: const BorderSide(color: AppColors.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
        borderSide: const BorderSide(color: AppColors.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
        borderSide: const BorderSide(color: AppColors.onSurface),
      ),
      hintStyle: AppTypography.bodyMd.copyWith(color: colorScheme.outline),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.onSurface,
        foregroundColor: AppColors.canvas,
        textStyle: AppTypography.bodyMd.copyWith(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm * 2)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.onSurface,
        side: const BorderSide(color: AppColors.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm * 2)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.onSurface),
    ),

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        backgroundColor: AppColors.canvas,
        foregroundColor: AppColors.outline,
        selectedBackgroundColor: AppColors.surfaceContainerHigh,
        selectedForegroundColor: AppColors.onSurface,
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.onSurface,
      foregroundColor: AppColors.canvas,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
      ),
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.onSurfaceVariant,
      textColor: AppColors.onSurface,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.outlineVariant,
      thickness: 1,
      space: 1,
    ),

    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.onSurface,
      inactiveTrackColor: AppColors.surfaceContainerHigh,
      thumbColor: AppColors.onSurface,
    ),

    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? AppColors.onSurface
            : AppColors.surfaceContainerHigh;
      }),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? AppColors.canvas
            : AppColors.outline;
      }),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceContainerHigh,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.onSurface,
      linearTrackColor: AppColors.surfaceContainerHigh,
    ),
  );
}
