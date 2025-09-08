import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/constants/api_endpoints.dart';
import 'package:iams_fe/data/models/auth/auth_reponse.dart';
import 'package:iams_fe/data/models/auth/user_response.dart';
import 'package:iams_fe/network/api_clients.dart';
import 'package:iams_fe/network/base_api_response.dart';
import 'package:iams_fe/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
        ApiEndpoints.login,
        data: {'username': username, 'password': password},
      );
      return BaseApiResponse.fromSucces(result, AuthResponse.fromJson);
    } on DioException catch (e) {
      return BaseApiResponse.fromDioException(e);
    } catch (e) {
      return BaseApiResponse.failure(message: e.toString());
    }
  }

  Future<BaseApiResponse<UserResponse>> getMe() async {
    try {
      final result = await _client.get(ApiEndpoints.getMe);
      return BaseApiResponse.fromSucces(result, UserResponse.fromJson);
    } on DioException catch (e) {
      return BaseApiResponse.fromDioException(e);
    } catch (e) {
      return BaseApiResponse.failure(message: e.toString());
    }
  }
}
