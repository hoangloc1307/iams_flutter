class ApiResult<T> {
  final bool success;
  final String message;
  final T? data;
  final String? code;
  final Map<String, String>? fieldErrors;

  const ApiResult({
    required this.success,
    required this.message,
    this.code,
    this.data,
    this.fieldErrors,
  });

  factory ApiResult.success(T data) =>
      ApiResult(success: true, message: 'Success', data: data);

  factory ApiResult.failure({
    String? code,
    String message = 'Error',
    Map<String, String>? fieldErrors,
  }) => ApiResult(
    success: false,
    code: code,
    message: message,
    fieldErrors: fieldErrors,
  );
}
