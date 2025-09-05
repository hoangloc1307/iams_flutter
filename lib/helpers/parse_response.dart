// import '../network/api_response.dart';

// ApiResponse<T> parseEnvelope<T>(
//   Map<String, dynamic>? body,
//   T Function(Map<String, dynamic> json) fromJson,
// ) {
//   final map = body ?? const <String, dynamic>{};
//   if (map['success'] == true) {
//     final data = map['data'] as Map<String, dynamic>? ?? {};
//     return ApiResponse.success(fromJson(data));
//   } else {
//     final code = map['code'] as String?;
//     final message = map['message'] as String;
//     Map<String, String>? fieldErrors;
//     final d = map['data'];
//     if (d is Map) {
//       fieldErrors = d.map<String, String>(
//         (k, v) => MapEntry(k.toString(), v.toString()),
//       );
//     }
//     return ApiResponse.failure(
//       code: code,
//       message: message,
//     );
//   }
// }
