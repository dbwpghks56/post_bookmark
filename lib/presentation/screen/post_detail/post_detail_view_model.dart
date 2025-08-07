import 'package:flutter/foundation.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_state.dart';

class PostDetailViewModel extends ChangeNotifier {
  final PostRepository _repository;

  PostDetailState _state = const PostDetailState();

  PostDetailViewModel({required PostRepository repository})
    : _repository = repository;

  PostDetailState get state => _state;

  Future<void> init({required int postId}) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      Post post = await _repository.findByPostId(postId: postId);

      _state = state.copyWith(isLoading: false, post: post);
      notifyListeners();
    } on Exception catch (e) {
      _state = state.copyWith(isLoading: false, error: e);
      notifyListeners();
    }
  }
}
