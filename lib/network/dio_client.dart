import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(minutes: 15),
    Duration receiveTimeout = const Duration(minutes: 20),
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: connectTimeout,
           receiveTimeout: receiveTimeout,
           headers: {
             'Accept': 'application/json',
             'Content-Type': 'application/json',
             if (headers != null) ...headers,
           },
         ),
       ) {
    if (interceptors != null && interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Dio get raw => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) => _dio.get<T>(
    path,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) => _dio.post<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<T>> postFormData<T>(
    String path, {
    Map<String, dynamic>? fields,
    Map<String, dynamic>? queryParameters,
    List<MultipartFile>? files,
    Options? options,
    CancelToken? cancelToken,
  }) {
    final formData = FormData.fromMap({
      if (files != null && files.isNotEmpty) 'files': files,
      if (fields != null && fields.isNotEmpty) ...fields,
    });

    return _dio.post<T>(
      path,
      data: formData,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) => _dio.put<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) => _dio.patch<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) => _dio.delete<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<T>> fetch<T>(
    RequestOptions requestOptions, {
    CancelToken? cancelToken,
  }) {
    final opts = requestOptions.copyWith(
      cancelToken: cancelToken ?? requestOptions.cancelToken,
    );
    return _dio.fetch<T>(opts);
  }
}
