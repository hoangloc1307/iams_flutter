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

  Future<User> login(String username, String password) async {
    final auth = await _service.login(username, password);
    _storage.write('access_token', auth.tokens.accessToken);

    return auth.user.toDomainUser();
  }
}
