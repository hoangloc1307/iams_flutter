import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/domain/models/post/post.dart';
import 'package:iams_fe/network/api_clients.dart';
import 'package:iams_fe/network/base_api_response.dart';
import 'package:iams_fe/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_service.g.dart';

@riverpod
PostService postService(Ref ref) {
  final client = ref.watch(jsonHolderApiClientProvider);
  return PostService(client);
}

class PostService {
  final DioClient _client;

  PostService(this._client);

  Future<BaseApiResponse<List<Post>>> getPosts({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final res = await _client.get(
        '/posts',
        queryParameters: {
          '_page': page,
          '_limit': limit,
          '_sort': 'id',
          '_order': 'desc',
        },
      );

      final list = (res.data as List)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();

      return BaseApiResponse.success(list);
    } on DioException catch (e) {
      return BaseApiResponse.fromDioException(e);
    } catch (e) {
      return BaseApiResponse.failure(message: e.toString());
    }
  }

  Future<BaseApiResponse<Post>> addPost({
    required int userId,
    required String title,
    required String body,
  }) async {
    try {
      final res = await _client.post(
        '/posts',
        data: {'userId': userId, 'title': title, 'body': body},
      );

      final post = Post.fromJson(res.data as Map<String, dynamic>);

      return BaseApiResponse.success(post);
    } on DioException catch (e) {
      return BaseApiResponse.fromDioException(e);
    } catch (e) {
      return BaseApiResponse.failure(message: e.toString());
    }
  }

  Future<BaseApiResponse<bool>> deletePost(int id) async {
    try {
      await _client.delete('/posts/$id');

      return BaseApiResponse.success(true);
    } on DioException catch (e) {
      return BaseApiResponse.fromDioException(e);
    } catch (e) {
      return BaseApiResponse.failure(message: e.toString());
    }
  }
}
