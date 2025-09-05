import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/network/interceptors/base_api_interceptor.dart';

import '../env/env.dart';
import 'dio_client.dart';

final baseApiClientProvider = Provider<DioClient>((ref) {
  final baseUrl = Env.baseApiUrl;
  return DioClient(baseUrl: baseUrl, interceptors: []);
});

final hrApiClientProvider = Provider<DioClient>((ref) {
  final baseUrl = Env.hrApiUrl;
  return DioClient(baseUrl: baseUrl, interceptors: []);
});
