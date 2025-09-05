import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../network/api_clients.dart';
import '../../network/base_api_response.dart';
import '../../network/dio_client.dart';
import '../models/auth/auth_reponse.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) {
  final client = ref.watch(baseApiClientProvider);
  return AuthService(client);
}

class AuthService {
  final DioClient _client;

  AuthService(this._client);

  Future<BaseApiResponse<AuthResponse>> login(
    String username,
    String password,
  ) async {
    try {
      final result = await _client.post(
        '/auth/login',
        data: {'username': username, 'password': password},
      );
      return BaseApiResponse.fromSucces(result, AuthResponse.fromJson);
    } on DioException catch (e) {
      return BaseApiResponse.fromDioException(e);
    } catch (e) {
      return BaseApiResponse.failure(message: e.toString());
    }
  }
}
