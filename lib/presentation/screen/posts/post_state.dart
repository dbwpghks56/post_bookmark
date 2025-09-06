import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/post/domain/model/post.dart';

part 'post_state.freezed.dart';

class PostState extends BaseState {
  final List<Post> posts;
  final Set<String> bookmarks;

  PostState({this.posts = const [], this.bookmarks = const {}});

  PostState copyWith({List<Post>? posts, Set<String>? bookmarks}) {
    return PostState(
      posts: posts ?? this.posts,
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }
}
