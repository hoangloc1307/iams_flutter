class BaseApiResponse<T> {
  final bool success;
  final String message;
  final String? code;
  final T? data;

  const BaseApiResponse({
    required this.success,
    required this.message,
    this.code,
    this.data,
  });
}
