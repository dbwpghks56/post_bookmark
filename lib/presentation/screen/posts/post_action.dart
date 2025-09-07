import 'package:flutter/material.dart';
import 'package:post_bookmark/core/base/base_action.dart';

sealed class PostAction implements BaseAction {
  const factory PostAction.tapPost({
    required int postId,
    required BuildContext context,
  }) = TapPost;
  const factory PostAction.tapBookMark({required int postId}) = TapBookMark;
}

@immutable
class TapPost implements PostAction {
  final int postId;
  final BuildContext context;

  const TapPost({required this.postId, required this.context});
}

@immutable
class TapBookMark implements PostAction {
  final int postId;

  const TapBookMark({required this.postId});
}
