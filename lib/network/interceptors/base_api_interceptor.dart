import 'package:dio/dio.dart';

import '../../data/models/auth/token.dart';
import '../../helpers/secure_storage.dart';
import '../base_api_response.dart';
import '../dio_client.dart';

class BaseApiInterceptor extends Interceptor {
  final SecureStorage _storage;
  final DioClient _client;
  bool _isRefreshing = false;
  final _pendingRequests = <void Function(String token)>[];

  BaseApiInterceptor(this._storage, this._client);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.contains('/auth/refresh')) {
      return handler.next(options);
    }

    if (_isRefreshing) {
      _pendingRequests.add((String token) {
        options.headers['Authorization'] = 'Bearer $token';
        handler.next(options);
      });
      return;
    }

    final token = await _storage.read('access_token');

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final requestOptions = err.requestOptions;

    final alreadyRetried = requestOptions.extra['__ret'] == true;
    if (alreadyRetried) {
      return handler.next(err);
    }

    try {} catch (e) {
      handler.next(err);
    }
  }

  Future<void> _refreshTokenAndRetry(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_isRefreshing) {
      _isRefreshing = true;

      try {
        final newToken = await _refreshToken();

        if (newToken != null) {
          // Retry original request
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newToken';
          options.extra['__retried'] = true;

          final response = await _client.fetch(options);
          handler.resolve(response);

          for (final callback in _pendingRequests) {
            callback(newToken);
          }
          _pendingRequests.clear();
        } else {
          // Refresh failed, redirect to login
          await _handleRefreshFailure();
          handler.next(err);
          _pendingRequests.clear();
        }
      } catch (e) {
        await _handleRefreshFailure();
        handler.next(err);
        _pendingRequests.clear();
      } finally {
        _isRefreshing = false;
      }
    } else {
      // Wait for ongoing refresh to complete
      // This is simplified, in production you might want to use Completer
      await Future.delayed(Duration(milliseconds: 100));

      final token = await _storage.read('access_token');
      if (token != null) {
        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $token';
        options.extra['__retried'] = true;

        try {
          final response = await _client.fetch(options);
          handler.resolve(response);
        } catch (e) {
          handler.next(err);
        }
      } else {
        handler.next(err);
      }
    }
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _storage.read('refresh_token');

      if (refreshToken == null || refreshToken.isEmpty) {
        return null;
      }

      BaseApiResponse response;
      try {
        final result = await _client.post(
          '/auth/refresh',
          data: {refreshToken: refreshToken},
        );

        response = BaseApiResponse.fromSucces(result, Token.fromJson);
      } on DioException catch (e) {
        response = BaseApiResponse.fromDioException(e);
      } catch (e) {
        response = BaseApiResponse.failure(message: e.toString());
      }

      if (response.success == true) {
        final data = response.data as Token;
        final newAccessToken = data.accessToken;
        final newRefreshToken = data.refreshToken;

        await _storage.write('access_token', newAccessToken);
        await _storage.write('refresh_token', newRefreshToken);

        return newAccessToken;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> _handleRefreshFailure() async {
    // Clear all tokens
    await _storage.delete('access_token');
    await _storage.delete('refresh_token');

    // Clear pending requests
    _pendingRequests.clear();

    // Navigate to login (you need to implement this based on your navigation)
    // Example: navigatorKey.currentState?.pushReplacementNamed('/login');
  }
}
