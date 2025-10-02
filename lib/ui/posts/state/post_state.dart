import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iams_fe/domain/models/post/post.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    @Default(<Post>[]) List<Post> posts,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(true) bool hasMore,
    @Default(1) int page,
  }) = _PostState;

  factory PostState.initial() => const PostState();
}
