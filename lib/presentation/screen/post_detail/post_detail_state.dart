import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_bookmark/core/base/base_state.dart';
import 'package:post_bookmark/post/domain/model/post.dart';

class PostDetailState extends BaseState<Post> {
  PostDetailState()
    : super(
        data: Post(userId: 0, body: '', id: 0, title: ''),
        exception: null,
      );
}
