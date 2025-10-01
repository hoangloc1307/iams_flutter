import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/env/env.dart';
import 'package:iams_fe/helpers/secure_storage.dart';
import 'package:iams_fe/network/dio_client.dart';
import 'package:iams_fe/network/interceptors/base_api_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_clients.g.dart';

@Riverpod(keepAlive: true)
DioClient baseApiClient(Ref ref) {
  final storage = ref.read(secureStorageProvider);
  return DioClient(
    baseUrl: Env.baseApiUrl,
    interceptors: [BaseApiInterceptor(storage)],
  );
}

@Riverpod(keepAlive: true)
DioClient hrApiClient(Ref ref) {
  return DioClient(baseUrl: Env.hrApiUrl, interceptors: []);
}

@riverpod
DioClient jsonHolderApiClient(Ref ref) {
  return DioClient(baseUrl: Env.jsonHolderApiUrl, interceptors: []);
}
