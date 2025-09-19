import 'package:flutter/material.dart';
import 'package:iams_fe/utils/core_utils.dart';

abstract final class AppColors {
  // ====================================== LIGHT MODE ======================================
  // Brand
  static const Color primaryLight = Color.fromRGBO(29, 78, 216, 1);
  static const Color onPrimaryLight = Color.fromRGBO(255, 255, 255, 1);

  // Background / Surface
  static const Color backgroundLight = Color.fromRGBO(255, 255, 255, 1);
  static const Color surfaceLight = Color.fromRGBO(249, 250, 251, 1);

  // Text
  static const Color textPrimaryLight = Color.fromRGBO(17, 24, 39, 1);
  static const Color textSecondaryLight = Color.fromRGBO(75, 85, 99, 1);

  // States
  static const Color successLight = Color.fromRGBO(6, 95, 70, 1);
  static const Color errorLight = Color.fromRGBO(153, 27, 27, 1);
  static const Color warningLight = Color.fromRGBO(146, 64, 14, 1);
  static const Color infoLight = Color.fromRGBO(30, 64, 175, 1);

  // ====================================== DARK MODE ======================================

  // Brand
  static const Color primaryDark = Color.fromRGBO(37, 99, 235, 1);
  static const Color onPrimaryDark = Color.fromRGBO(255, 255, 255, 1);

  // Background / Surface
  static const Color backgroundDark = Color.fromRGBO(17, 24, 39, 1);
  static const Color surfaceDark = Color.fromRGBO(31, 41, 55, 1);

  // Text
  static const Color textPrimaryDark = Color.fromRGBO(255, 255, 255, 1);
  static const Color textSecondaryDark = Color.fromRGBO(156, 163, 175, 1);

  // States
  static const Color successDark = Color.fromRGBO(52, 211, 153, 1);
  static const Color errorDark = Color.fromRGBO(248, 113, 113, 1);
  static const Color warningDark = Color.fromRGBO(252, 211, 77, 1);
  static const Color infoDark = Color.fromRGBO(96, 165, 250, 1);

  // ====================================== ADAPTIVE ======================================
  static Color textPrimary(BuildContext context) => CoreUtils.apdativeColor(
    context,
    lightModeColor: textPrimaryLight,
    darkModeColor: textPrimaryDark,
  );
}
