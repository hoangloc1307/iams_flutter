import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage.g.dart';

@riverpod
SecureStorage secureStorage(Ref ref) {
  return SecureStorage();
}

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    webOptions: WebOptions.defaultOptions,
  );

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
