import 'package:post_bookmark/core/base/base_component_enum.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/post/domain/model/post.dart';

enum PostComponentLoading implements BaseComponentEnum { button }

class PostState extends BaseState<PostState> {
  final List<Post> posts;
  final Set<String> bookmarks;

  const PostState({
    this.posts = const [],
    this.bookmarks = const {},
    super.isLoading = false,
    super.isRefresh = false,
    super.error,
    super.componentsLoading,
  });

  @override
  PostState copyWith({
    List<Post>? posts,
    Set<String>? bookmarks,
    bool? isLoading,
    bool? isRefresh,
    Exception? error,
    Map<String, bool>? componentsLoading,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      bookmarks: bookmarks ?? this.bookmarks,
      isLoading: isLoading ?? this.isLoading,
      isRefresh: isRefresh ?? this.isRefresh,
      error: error ?? this.error,
      componentsLoading: componentsLoading ?? this.componentsLoading,
    );
  }
}
