import 'package:flutter/foundation.dart';
import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';
import 'package:post_bookmark/core/usecase/toggle_bookmark_usecase.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';

class PostViewModel extends ChangeNotifier {
  final PostRepository _repository;
  final BookmarkDataSource _bookmarkDataSource;
  final ToggleBookmarkUsecase _usecase;
  PostState _state = const PostState();

  PostViewModel({
    required PostRepository repository,
    required ToggleBookmarkUsecase usecase,
    required BookmarkDataSource datasource,
  }) : _repository = repository,
       _usecase = usecase,
       _bookmarkDataSource = datasource;

  PostState get state => _state;

  Future<void> onAction(PostAction action) async {
    switch (action) {
      case TapPost():
        break;
      case TapBookMark():
        await _tapBookMark(action.postId);
        break;
    }
  }

  Future<void> _tapBookMark(int postId) async {
    final Set<String> bookmarks = await _usecase.execute(postId);
    _state = state.copyWith(bookmarks: bookmarks);
    notifyListeners();
  }

  Future<void> init() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final List<Post> posts = await _repository.findAll();
      final Set<String> bookmarks = await _bookmarkDataSource.findAll();
      _state = state.copyWith(
        isLoading: false,
        posts: posts,
        bookmarks: bookmarks,
      );
      notifyListeners();
    } on Exception catch (e) {
      _state = state.copyWith(isLoading: false, error: e);
      notifyListeners();
    }
  }
}
