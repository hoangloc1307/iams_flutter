import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/constants/storage_keys.dart';
import 'package:iams_fe/data/services/auth_service.dart';
import 'package:iams_fe/domain/models/user/user.dart';
import 'package:iams_fe/helpers/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final service = ref.watch(authServiceProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthRepository(service, storage);
}

class AuthRepository {
  final AuthService _service;
  final SecureStorage _storage;

  AuthRepository(this._service, this._storage);

  Future<Either<String, User>> login(String username, String password) async {
    try {
      // Gọi service login
      final data = await _service.login(username, password);

      // Nếu lỗi trả về message lỗi
      if (data.success == false) return Left(data.message);

      // Lưu lại access token và refresh token
      await Future.wait([
        _storage.write(StorageKeys.accessToken, data.data!.tokens.accessToken),
        _storage.write(
          StorageKeys.refreshToken,
          data.data!.tokens.refreshToken,
        ),
      ]);

      // Trả về thông tin user
      return Right(data.data!.user.toDomainUser());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> logout() async {
    try {
      final res = await _service.logout();

      if (res.success == false) return Left(res.message);

      await Future.wait([
        _storage.delete(StorageKeys.accessToken),
        _storage.delete(StorageKeys.refreshToken),
      ]);

      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, User>> getCurrentUser() async {
    try {
      final token = await _storage.read(StorageKeys.accessToken);
      if (token == null || token == '') return Left('Token not found.');

      final data = await _service.getMe();

      if (data.success == false) return Left(data.message);

      return Right(data.data!.toDomainUser());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
