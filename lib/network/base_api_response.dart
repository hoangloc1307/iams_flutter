import 'package:dio/dio.dart';

class BaseApiResponse<T> {
  final bool success;
  final String? code;
  final String message;
  final T? data;

  const BaseApiResponse({
    required this.success,
    this.code,
    required this.message,
    this.data,
  });

  factory BaseApiResponse.success(T data) =>
      BaseApiResponse(success: true, message: 'Success', data: data);

  factory BaseApiResponse.failure({String? code, String? message}) =>
      BaseApiResponse(
        success: false,
        code: code ?? 'SERVER_ERROR',
        message: message ?? 'Error',
      );

  static BaseApiResponse<T> fromSucces<T>(
    Response<dynamic> response,
    T Function(Map<String, dynamic> json)? fromJson,
  ) {
    final res =
        (response.data ?? const <String, dynamic>{}) as Map<String, dynamic>;

    if (res['success'] == true) {
      final raw = res['data'];
      final T value = fromJson != null ? fromJson(raw) : raw as T;
      return BaseApiResponse.success(value);
    } else {
      final code = res['code'] as String?;
      final message = res['message'] as String?;

      return BaseApiResponse.failure(code: code, message: message);
    }
  }

  static BaseApiResponse<T> fromDioException<T>(DioException exception) {
    final res = exception.response;

    final code = res?.data['code'] ?? 'DIO_ERROR';
    final message = res?.data['message'] ?? exception.message;

    return BaseApiResponse.failure(code: code, message: message);
  }
}
