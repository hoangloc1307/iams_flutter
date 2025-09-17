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
    useMaterial3: true,
  );
}
