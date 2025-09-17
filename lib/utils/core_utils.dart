import 'package:flutter/material.dart';

abstract class CoreUtils {
  static Color apdativeColor(
    BuildContext context, {
    required Color lightModeColor,
    required Color darkModeColor,
  }) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.dark
        ? darkModeColor
        : lightModeColor;
  }
}
