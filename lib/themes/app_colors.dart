import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary = Color.fromRGBO(0, 12, 122, 1);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondary = Color.fromRGBO(108, 117, 125, 1);
  static const Color onSecondary = Color.fromRGBO(255, 255, 255, 1);

  // Background / Surface
  static const Color lightBackground = Color.fromRGBO(249, 250, 251, 1);
  static const Color lightSurface = Color.fromRGBO(255, 255, 255, 1);

  static const Color darkBackground = Color.fromRGBO(1, 6, 24, 1);
  static const Color darkSurface = Color.fromRGBO(15, 24, 40, 1);

  // Text
  static const Color lightTextPrimary = Color.fromRGBO(2, 7, 19, 1);
  static const Color lightTextSecondary = Color.fromRGBO(110, 118, 133, 1);

  static const Color darkTextPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color darkTextSecondary = Color.fromRGBO(152, 161, 174, 1);

  // States
  static const Color success = Color.fromRGBO(46, 204, 113, 1);
  static const Color error = Color.fromRGBO(231, 76, 60, 1);
  static const Color warning = Color.fromRGBO(241, 196, 15, 1);
  static const Color info = Color.fromRGBO(52, 152, 219, 1);

  static Color textPrimary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? darkTextPrimary : lightTextPrimary;
  }
}
