import 'package:iams_fe/data/repositories/post_repository.dart';
import 'package:iams_fe/ui/posts/state/post_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  static const _pageSize = 10;

  @override
  PostState build() {
    return PostState.initial();
  }

  Future<void> loadInitial() async {
    if (state.items.isNotEmpty) return;
    await refresh();
  }

  Future<void> refresh() async {
    state = state.copyWith(loading: true, error: null, page: 1, hasMore: true);
    final repo = ref.read(postRepositoryProvider);

    final result = await repo.getPosts(page: 1, limit: _pageSize);
    result.fold(
      (err) => state = state.copyWith(loading: false, error: err),
      (data) => state = state.copyWith(
        loading: false,
        items: data,
        hasMore: data.length == _pageSize,
        page: 1,
      ),
    );
  }

  Future<void> fetchMore() async {
    if (!state.hasMore || state.loading) return;

    state = state.copyWith(loading: true, error: null);
    final nextPage = state.page + 1;
    final repo = ref.read(postRepositoryProvider);

    final result = await repo.getPosts(page: nextPage, limit: _pageSize);
    result.fold(
      (err) {
        state = state.copyWith(loading: false, error: err);
      },
      (data) {
        state = state.copyWith(
          loading: false,
          items: [...state.items, ...data],
          hasMore: data.length == _pageSize,
          page: nextPage,
        );
      },
    );
  }
}
