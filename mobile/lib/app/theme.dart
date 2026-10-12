import 'package:flutter/material.dart';

import 'design_tokens.dart';

/// Builds the app's Material 3 [ThemeData] from the "Executive Command
/// Center" design system (design/DESIGN.md): a fixed dark zinc palette
/// (there is no separate light variant defined in that system), Geist for
/// headlines/labels/metrics, Inter for body copy, hairline borders instead
/// of drop shadows, and Level-2-rounded shapes.
ThemeData buildAppTheme({bool dark = false}) {
  final colorScheme = ColorScheme(
    brightness: dark ? Brightness.dark : Brightness.light,
    surface: dark ? const Color(0xFF131315) : AppColors.surface,
    onSurface: dark ? const Color(0xFFE5E1E4) : AppColors.onSurface,
    onSurfaceVariant: dark ? const Color(0xFFC8C5CB) : AppColors.onSurfaceVariant,
    surfaceContainerLowest: dark ? const Color(0xFF0E0E10) : AppColors.surfaceContainerLowest,
    surfaceContainerLow: dark ? const Color(0xFF1C1B1D) : AppColors.surfaceContainerLow,
    surfaceContainer: dark ? const Color(0xFF201F22) : AppColors.surfaceContainer,
    surfaceContainerHigh: dark ? const Color(0xFF2A2A2C) : AppColors.surfaceContainerHigh,
    surfaceContainerHighest: dark ? const Color(0xFF353437) : AppColors.surfaceContainerHighest,
    outline: dark ? const Color(0xFF919095) : AppColors.outline,
    outlineVariant: dark ? const Color(0xFF47464B) : AppColors.outlineVariant,
    primary: dark ? const Color(0xFFBEC2FF) : AppColors.primary,
    onPrimary: dark ? const Color(0xFF303033) : AppColors.onPrimary,
    primaryContainer: dark ? const Color(0xFF343DFF) : AppColors.primaryContainer,
    onPrimaryContainer: dark ? const Color(0xFFB3B7FF) : AppColors.onPrimaryContainer,
    secondary: dark ? const Color(0xFFC6C6C7) : AppColors.secondary,
    onSecondary: dark ? const Color(0xFF2F3131) : AppColors.onSecondary,
    secondaryContainer: dark ? const Color(0xFF454747) : AppColors.secondaryContainer,
    onSecondaryContainer: dark ? const Color(0xFFB4B5B5) : AppColors.onSecondaryContainer,
    tertiary: dark ? const Color(0xFFCBC6BD) : AppColors.tertiary,
    onTertiary: dark ? const Color(0xFF33302A) : AppColors.onTertiary,
    tertiaryContainer: dark ? const Color(0xFF1A1813) : AppColors.tertiaryContainer,
    onTertiaryContainer: dark ? const Color(0xFF85817A) : AppColors.onTertiaryContainer,
    error: dark ? const Color(0xFFFFB4AB) : AppColors.error,
    onError: dark ? const Color(0xFF690005) : AppColors.onError,
    errorContainer: dark ? const Color(0xFF93000A) : AppColors.errorContainer,
    onErrorContainer: dark ? const Color(0xFFFFDAD6) : AppColors.onErrorContainer,
    inversePrimary: dark ? const Color(0xFF5F5E61) : AppColors.primaryFixedDim,
    inverseSurface: dark ? const Color(0xFFE5E1E4) : AppColors.inverseSurface,
    onInverseSurface: dark ? const Color(0xFF313032) : AppColors.inverseOnSurface,
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
    scaffoldBackgroundColor: colorScheme.surface,
    textTheme: textTheme,
    fontFamily: 'Inter',

    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 64,
      titleTextStyle: AppTypography.headlineMd.copyWith(
        fontSize: 22,
        color: colorScheme.onSurface,
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surfaceContainerLowest,
      indicatorColor: dark ? colorScheme.surfaceContainerHigh : AppColors.primaryFixed,
      surfaceTintColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return AppTypography.labelCaps.copyWith(
          color: selected ? colorScheme.primary : colorScheme.outline,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? colorScheme.primary : colorScheme.outline,
        );
      }),
    ),

    cardTheme: CardThemeData(
      elevation: 0,
      color: colorScheme.surfaceContainerLowest,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: colorScheme.surfaceContainerHigh),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      side: const BorderSide(color: Colors.transparent),
      labelStyle: AppTypography.labelCaps.copyWith(color: colorScheme.onSurfaceVariant),
      shape: StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
        borderSide: BorderSide(color: colorScheme.surfaceContainerHigh),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
        borderSide: BorderSide(color: colorScheme.surfaceContainerHigh),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm * 2),
        borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
      ),
      hintStyle: AppTypography.bodyMd.copyWith(color: colorScheme.outline),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimary,
        textStyle: AppTypography.bodyMd.copyWith(fontWeight: FontWeight.w600),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colorScheme.primary),
    ),

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.outline,
        selectedBackgroundColor: dark ? colorScheme.surfaceContainerHigh : AppColors.primaryFixed,
        selectedForegroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimary,
      shape: StadiumBorder(),
    ),

    listTileTheme: ListTileThemeData(
      iconColor: colorScheme.onSurfaceVariant,
      textColor: colorScheme.onSurface,
    ),

    dividerTheme: DividerThemeData(
      color: colorScheme.outlineVariant,
      thickness: 1,
      space: 1,
    ),

    sliderTheme: SliderThemeData(
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.surfaceContainerHigh,
      thumbColor: colorScheme.primary,
    ),

    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? colorScheme.primary
            : colorScheme.surfaceContainerHigh;
      }),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? colorScheme.onPrimary
            : colorScheme.outline;
      }),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: colorScheme.surfaceContainerHigh,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.surfaceContainerHigh,
    ),
  );
}
