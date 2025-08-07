import 'package:flutter/foundation.dart';
import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_action.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_state.dart';

class PostDetailViewModel extends ChangeNotifier {
  final PostRepository _repository;
  final BookmarkDataSource _bookmarkDataSource;

  PostDetailState _state = const PostDetailState();

  PostDetailViewModel({
    required PostRepository repository,
    required BookmarkDataSource bookmarkDataSource,
  }) : _repository = repository,
       _bookmarkDataSource = bookmarkDataSource;

  PostDetailState get state => _state;

  Future<void> onAction(PostDetailAction action) async {
    switch (action) {
      case TapBookMark():
        await _tapBookMark(action.postId);
    }
  }

  Future<void> _tapBookMark(int postId) async {
    await _bookmarkDataSource.toggleBookmarkByPostId(postId);
    final bool isBookmark = _bookmarkDataSource.containBookmark(postId);

    _state = state.copyWith(isBookmark: isBookmark);
    notifyListeners();
  }

  Future<void> init({required int postId}) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final Post post = await _repository.findByPostId(postId: postId);
      final bool isBookmark = _bookmarkDataSource.containBookmark(postId);

      _state = state.copyWith(
        isLoading: false,
        post: post,
        isBookmark: isBookmark,
      );
      notifyListeners();
    } on Exception catch (e) {
      _state = state.copyWith(isLoading: false, error: e);
      notifyListeners();
    }
  }
}
