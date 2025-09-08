import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i18n.g.dart';

@riverpod
I18n i18n(Ref ref, BuildContext context) {
  return I18n(context);
}

class I18n {
  final BuildContext context;

  I18n(this.context);

  String t(String key, {Map<String, String>? namedArgs, List<String>? args}) {
    return tr(key, namedArgs: namedArgs, args: args);
  }

  Future<void> setLocale(Locale locale) async {
    await context.setLocale(locale);
  }

  Locale get currentLocale => context.locale;

  List<Locale> get supportedLocales => context.supportedLocales;

  List<LocalizationsDelegate<dynamic>> get delegates =>
      context.localizationDelegates;
}
