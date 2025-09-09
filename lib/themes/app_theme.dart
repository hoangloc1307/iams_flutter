import 'package:flutter/material.dart';
import 'package:iams_fe/themes/app_text_styles.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  // Light Theme
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(surface: AppColors.lightSurface),
    textTheme: TextTheme(
      headlineMedium: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
    ),
    useMaterial3: true,
  );

  // Dark Theme
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(surface: AppColors.darkSurface),
    textTheme: TextTheme(
      headlineMedium: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
    ),
    useMaterial3: true,
  );
}
