import 'package:easy_localization/easy_localization.dart';

typedef Validator = String? Function(String?);

abstract class Validators {
  /// Bắt buộc phải có giá trị
  static Validator required({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return message ?? 'errors.required'.tr();
      }
      return null;
    };
  }

  /// Độ dài tối thiểu
  static Validator minLength(int length, {String? message}) {
    return (String? value) {
      if (value == null || value.trim().length < length) {
        return message ?? 'errors.minLength'.tr(namedArgs: {'min': '$length'});
      }
      return null;
    };
  }

  /// Độ dài tối đa
  static Validator maxLength(int length, {String? message}) {
    return (String? value) {
      if (value != null && value.trim().length > length) {
        return message ?? 'errors.maxLength'.tr(namedArgs: {'max': '$length'});
      }
      return null;
    };
  }

  /// Regex pattern
  static Validator pattern(RegExp regex, {String? message}) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;
      if (!regex.hasMatch(value)) {
        return message ?? 'errors.pattern'.tr();
      }
      return null;
    };
  }

  /// Kết hợp nhiều validators
  static Validator combine(List<Validator> list) {
    return (v) {
      for (final fn in list) {
        final err = fn(v);
        if (err != null) return err;
      }
      return null;
    };
  }
}
