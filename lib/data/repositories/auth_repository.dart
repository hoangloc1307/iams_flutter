import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/auth_reponse.dart';
import '../services/auth_service.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final service = ref.watch(authServiceProvider);
  return AuthRepository(service);
}

class AuthRepository {
  final AuthService _service;

  AuthRepository(this._service);

  Future<AuthResponse> login(String username, String password) async {
    final raw = await _service.login(username, password);
    final auth = AuthResponse.fromJson(raw['data']);

    return auth;
  }
}
