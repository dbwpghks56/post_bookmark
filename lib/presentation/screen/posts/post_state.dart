import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_bookmark/post/domain/model/post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  final bool isLoading;
  final List<Post> posts;
  final Set<String> bookmarks;
  final Exception? error;

  const PostState({
    this.isLoading = false,
    this.posts = const [],
    this.error,
    this.bookmarks = const {},
  });
}
