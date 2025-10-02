import 'dart:math';

import 'package:iams_fe/data/repositories/post_repository.dart';
import 'package:iams_fe/domain/models/post/post.dart';
import 'package:iams_fe/ui/posts/state/post_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  static const _pageSize = 3;

  @override
  Future<PostState> build() async {
    final repo = ref.read(postRepositoryProvider);

    final result = await repo.getPosts(page: 1, limit: _pageSize);

    return result.fold(
      (error) => PostState(posts: [], errorMessage: error),
      (posts) => PostState(posts: posts),
    );
  }

  Future<void> addPost({
    required int userId,
    required String title,
    required String body,
  }) async {
    state = const AsyncValue.loading();
    final repository = ref.read(postRepositoryProvider);

    final result = await repository.addPost(
      userId: userId,
      title: title,
      body: body,
    );
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (posts) => refresh(),
    );
  }

  Future<void> deletePost(int id) async {
    state = const AsyncValue.loading();
    final repository = ref.read(postRepositoryProvider);
    final result = await repository.deletePost(id);
    result.fold((error) => state = AsyncError(error, StackTrace.current), (
      success,
    ) {
      if (success == true) {
        refresh();
      } else {
        state = AsyncError('Xoá post thất bại', StackTrace.empty);
      }
    });
  }

  Future<void> refresh() async {
    final repository = ref.read(postRepositoryProvider);
    final result = await repository.getPosts(page: 1, limit: _pageSize);
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (posts) => state = AsyncData(PostState(posts: posts)),
    );
  }
}
