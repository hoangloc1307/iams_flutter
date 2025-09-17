import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/routing/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i18n.g.dart';

@riverpod
I18n i18n(Ref ref) {
  return I18n();
}

class I18n {
  BuildContext get _ctx => navigatorKey.currentContext!;

  String t(String key, {Map<String, String>? namedArgs, List<String>? args}) {
    return tr(key, namedArgs: namedArgs, args: args);
  }

  Future<void> setLocale(Locale locale) async {
    await _ctx.setLocale(locale);
  }

  Locale get currentLocale => _ctx.locale;

  List<Locale> get supportedLocales => _ctx.supportedLocales;

  List<LocalizationsDelegate<dynamic>> get delegates =>
      _ctx.localizationDelegates;
}
