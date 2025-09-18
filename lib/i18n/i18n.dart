import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class I18n {
  static String t(
    String key, {
    Map<String, String>? namedArgs,
    List<String>? args,
    String? gender,
  }) {
    return tr(key, namedArgs: namedArgs, args: args, gender: gender);
  }

  /// Đổi locale tại runtime
  static Future<void> setLocale(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
  }

  /// Lấy locale hiện tại
  static Locale locale(BuildContext context) => context.locale;

  /// Danh sách locale hỗ trợ
  static List<Locale> supportedLocales(BuildContext context) =>
      context.supportedLocales;

  /// Delegates
  static List<LocalizationsDelegate<dynamic>> delegates(BuildContext context) =>
      context.localizationDelegates;
}
