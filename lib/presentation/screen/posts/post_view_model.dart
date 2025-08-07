import 'package:flutter/foundation.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';

class PostViewModel extends ChangeNotifier {
  final PostRepository _repository;
  PostState _state = const PostState();

  PostState get state => _state;

  PostViewModel({required PostRepository repository})
    : _repository = repository;

  Future<void> action(PostAction action) async {
    switch (action) {
      case TapPost():
        // TODO: Handle this case.
        throw UnimplementedError();
      case TapBookMark():
        await _tapBookMark();
        break;
    }
  }

  Future<void> _tapBookMark() async {}

  Future<void> init() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    List<Post> posts = await _repository.findAll();
    _state = state.copyWith(isLoading: false, posts: posts);
    notifyListeners();
  }
}
