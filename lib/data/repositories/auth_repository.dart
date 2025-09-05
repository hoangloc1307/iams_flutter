import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/user/user.dart';
import '../../helpers/secure_storage.dart';
import '../services/auth_service.dart';

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
      final data = await _service.login(username, password);

      if (data.success == false || data.data == null) return Left(data.message);

      _storage.write('access_token', data.data!.tokens.accessToken);
      return Right(data.data!.user.toDomainUser());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
