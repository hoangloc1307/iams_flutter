import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/env/env.dart';
import 'package:iams_fe/helpers/secure_storage.dart';
import 'package:iams_fe/network/dio_client.dart';
import 'package:iams_fe/network/interceptors/base_api_interceptor.dart';

final baseApiClientProvider = Provider<DioClient>((ref) {
  final baseUrl = Env.baseApiUrl;
  final storage = ref.watch(secureStorageProvider);
  return DioClient(
    baseUrl: baseUrl,
    interceptors: [BaseApiInterceptor(storage)],
  );
});

final hrApiClientProvider = Provider<DioClient>((ref) {
  final baseUrl = Env.hrApiUrl;
  return DioClient(baseUrl: baseUrl, interceptors: []);
});
