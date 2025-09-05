import 'package:dio/dio.dart';

import '../../helpers/secure_storage.dart';

class BaseApiInterceptor extends Interceptor {
  final SecureStorage _storage;

  BaseApiInterceptor(this._storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read('access_token');

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
