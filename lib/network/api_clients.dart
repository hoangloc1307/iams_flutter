import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../env/env.dart';
import '../helpers/secure_storage.dart';
import 'dio_client.dart';
import 'interceptors/base_api_interceptor.dart';

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
