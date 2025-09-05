import 'package:flutter/foundation.dart';
import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_action.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_state.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';

class PostDetailViewModel extends BaseViewModel<PostDetailState> {
  final PostRepository _repository;
  final BookmarkDataSource _bookmarkDataSource;

  PostDetailViewModel({
    required PostRepository repository,
    required BookmarkDataSource bookmarkDataSource,
  }) : _repository = repository,
       _bookmarkDataSource = bookmarkDataSource,
       super(PostDetailState());

  Future<void> onAction(PostDetailAction action) async {
    switch (action) {
      case TapBookMark():
        await _tapBookMark(action.postId);
    }
  }

  Future<void> _tapBookMark(int postId) async {
    await _bookmarkDataSource.toggleBookmarkByPostId(postId);
    final bool isBookmark = _bookmarkDataSource.containBookmark(postId);
  }
}
