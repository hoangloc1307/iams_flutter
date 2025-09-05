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
  }
}
