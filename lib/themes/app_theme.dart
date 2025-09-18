import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  // Light Theme
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      surface: AppColors.surfaceLight,
      primary: AppColors.primaryLight,
      error: AppColors.errorLight,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      iconColor: AppColors.primaryLight,
      textColor: AppColors.primaryLight,
      collapsedIconColor: AppColors.textPrimaryLight,
      collapsedTextColor: AppColors.textPrimaryLight,
    ),
    useMaterial3: true,
  );

  // Dark Theme
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.surfaceDark,
      primary: AppColors.primaryDark,
      error: AppColors.errorDark,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      iconColor: AppColors.primaryDark,
      textColor: AppColors.primaryDark,
      collapsedIconColor: AppColors.textPrimaryDark,
      collapsedTextColor: AppColors.textPrimaryDark,
    ),
    useMaterial3: true,
  );

  static String themedAsset(
    BuildContext context, {
    required String light,
    required String dark,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? dark : light;
  }
}
