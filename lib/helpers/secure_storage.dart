import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'secure_storage.g.dart';

@riverpod
SecureStorage secureStorage(Ref ref) => SecureStorage();

class SecureStorage {
  SharedPreferences? _prefs;

  Future<SharedPreferences> _ensure() async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  // Lưu chuỗi
  Future<void> write(String key, String value) async {
    final p = await _ensure();
    await p.setString(key, value);
  }

  // Đọc chuỗi
  Future<String?> read(String key) async {
    final p = await _ensure();
    return p.getString(key);
  }

  // Xoá 1 key
  Future<void> delete(String key) async {
    final p = await _ensure();
    await p.remove(key);
  }

  // Kiểm tra tồn tại
  Future<bool> containsKey(String key) async {
    final p = await _ensure();
    return p.containsKey(key);
  }

  // Xoá tất cả
  Future<void> clear() async {
    final p = await _ensure();
    await p.clear();
  }
}
