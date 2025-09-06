import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class I18n {
  BuildContext? _context;

  void initialize(BuildContext context) {
    _context = context;
  }

  String t(String key, {List<String>? args, Map<String, String>? namedArgs}) {
    if (namedArgs != null && namedArgs.isNotEmpty) {
      return key.tr(namedArgs: namedArgs);
    }
    if (args != null && args.isNotEmpty) {
      return key.tr(args: args);
    }
    return key.tr();
  }

  Locale get currentLocale {
    if (_context != null) {
      return _context!.locale;
    }
    return const Locale('vi');
  }

  List<Locale> get supportedLocales {
    if (_context != null) {
      return _context!.supportedLocales;
    }
    return const [Locale('en'), Locale('vi')];
  }

  Future<void> setLocale(Locale locale) async {
    await _context!.setLocale(locale);
  }
}

final i18n = I18n();
