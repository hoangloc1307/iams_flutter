import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/translations/i18n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'validators.g.dart';

typedef Validator = String? Function(String?);

@riverpod
Validators validators(Ref ref) {
  final i18n = ref.watch(i18nProvider);
  return Validators(i18n);
}

class Validators {
  final I18n _i18n;
  Validators(this._i18n);

  String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? _i18n.t('errors.required');
    }
    return null;
  }

  Validator combine(List<Validator> list) {
    return (v) {
      for (final fn in list) {
        final err = fn(v);
        if (err != null) return err;
      }
      return null;
    };
  }
}
