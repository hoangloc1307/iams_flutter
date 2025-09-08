import 'package:dio/dio.dart';
import 'package:iams_fe/constants/api_endpoints.dart';
import 'package:iams_fe/constants/storage_keys.dart';
import 'package:iams_fe/helpers/secure_storage.dart';

class BaseApiInterceptor extends Interceptor {
  final SecureStorage _storage;
  Dio? _tokenDio;

  BaseApiInterceptor(this._storage) {
    _tokenDio = Dio();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.contains(ApiEndpoints.refresh)) {
      return handler.next(options);
    }

    final token = await _storage.read(StorageKeys.accessToken);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Chỉ xử lý khi lỗi 401
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains(ApiEndpoints.refresh)) {
      try {
        final refreshToken = await _storage.read(StorageKeys.refreshToken);

        if (refreshToken == null || refreshToken.isEmpty) {
          return handler.next(err); // không có refresh token -> logout
        }

        // Gọi API refresh
        final response = await _tokenDio!.post(
          '${err.requestOptions.baseUrl}${ApiEndpoints.refresh}',
          data: {'refreshToken': refreshToken},
          options: Options(headers: {'Content-Type': 'application/json'}),
        );

        final newAccessToken = response.data['data']['accessToken'];
        final newRefreshToken = response.data['data']['refreshToken'];

        // Lưu lại token mới
        if (newAccessToken != null) {
          await _storage.write(StorageKeys.accessToken, newAccessToken);
        }
        if (newRefreshToken != null) {
          await _storage.write(StorageKeys.refreshToken, newRefreshToken);
        }

        // Clone request cũ và thêm access token mới
        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $newAccessToken';

        final retryResponse = await _tokenDio!.fetch(opts);
        return handler.resolve(retryResponse);
      } catch (e) {
        // Refresh thất bại -> logout
        return handler.next(err);
      }
    }

    // Nếu không phải 401 thì cho đi tiếp
    return handler.next(err);
  }
}
