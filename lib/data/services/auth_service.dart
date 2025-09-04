import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../network/api_clients.dart';
import '../../network/base_response.dart';
import '../../network/dio_client.dart';
import '../models/auth_reponse.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) {
  final client = ref.watch(baseApiClientProvider);
  return AuthService(client);
}

class AuthService {
  final DioClient _client;

  AuthService(this._client);

  Future<AuthResponse> login(String username, String password) async {
    final result = await _client.postApi<AuthResponse>(
      '/auth/login',
      data: {'username': username, 'password': password},
      fromJson: (json) => AuthResponse.fromJson(json),
    );

    if (result.success && result.data != null) {
      return result.data!;
    }
    throw Exception('Login Service Error');
  }

  // Future<void> logout() async {
  //   await _client.post('/auth/logout');
  // }

  // Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
  //   final res = await _client.post('/auth/refresh', data: {
  //     'refreshToken': refreshToken,
  //   });
  //   return res.data as Map<String, dynamic>;
  // }

  // Future<Map<String, dynamic>> getMe() async {
  //   final res = await _client.get('/auth/me');
  //   return res.data as Map<String, dynamic>;
  // }
}
