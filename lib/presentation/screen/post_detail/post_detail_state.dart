import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_bookmark/post/domain/model/post.dart';

part 'post_detail_state.freezed.dart';

@freezed
class PostDetailState with _$PostDetailState {
  final bool isLoading;
  final Post post;
  final bool isBookmark;
  final Exception? error;

  const PostDetailState({
    this.isLoading = false,
    this.post = const Post(userId: 0, id: 0, title: 'N/A', body: 'N/A'),
    this.error,
    this.isBookmark = false,
  });
}
