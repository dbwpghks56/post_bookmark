import 'package:flutter/material.dart';

sealed class PostDetailAction {
  const factory PostDetailAction.tapBookMark({required int postId}) =
      TapBookMark;
}

@immutable
class TapBookMark implements PostDetailAction {
  final int postId;

  const TapBookMark({required this.postId});
}
