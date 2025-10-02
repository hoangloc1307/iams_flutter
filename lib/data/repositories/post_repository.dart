import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/data/services/post_service.dart';
import 'package:iams_fe/domain/models/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(Ref ref) {
  final service = ref.watch(postServiceProvider);
  return PostRepository(service);
}

class PostRepository {
  final PostService _service;

  PostRepository(this._service);

  Future<Either<String, List<Post>>> getPosts({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _service.getPosts(page: page, limit: limit);

      if (!response.success || response.data == null) {
        return Left(response.message);
      }

      return Right(response.data!);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Post>> addPost({
    required int userId,
    required String title,
    required String body,
  }) async {
    try {
      final response = await _service.addPost(
        userId: userId,
        title: title,
        body: body,
      );

      if (!response.success || response.data == null) {
        return Left(response.message);
      }

      return Right(response.data!);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> deletePost(int id) async {
    try {
      final response = await _service.deletePost(id);

      if (!response.success || response.data == null) {
        return Left(response.message);
      }

      return Right(response.data!);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
