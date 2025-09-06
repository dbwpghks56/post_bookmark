import 'package:flutter/material.dart';
import 'package:post_bookmark/core/base/base_action.dart';

sealed class PostAction implements BaseAction {
  const factory PostAction.tapPost({required int postId}) = TapPost;
  const factory PostAction.tapBookMark({required int postId}) = TapBookMark;
}

@immutable
class TapPost implements PostAction {
  final int postId;

  const TapPost({required this.postId});
}

@immutable
class TapBookMark implements PostAction {
  final int postId;

  const TapBookMark({required this.postId});
}
