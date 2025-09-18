typedef Validator = String? Function(String?);

abstract class Validators {
  static String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'errors.required';
    }
    return null;
  }

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
