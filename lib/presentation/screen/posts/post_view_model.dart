import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';
import 'package:post_bookmark/core/base/base_view_model.dart';
import 'package:post_bookmark/core/usecase/toggle_bookmark_usecase.dart';
import 'package:post_bookmark/post/domain/model/post.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/posts/post_action.dart';
import 'package:post_bookmark/presentation/screen/posts/post_state.dart';

class PostViewModel extends BaseViewModel<PostState> {
  final PostRepository _repository;
  final BookmarkDataSource _bookmarkDataSource;
  final ToggleBookmarkUsecase _usecase;

  PostViewModel({
    required PostRepository repository,
    required ToggleBookmarkUsecase usecase,
    required BookmarkDataSource datasource,
  }) : _repository = repository,
       _usecase = usecase,
       _bookmarkDataSource = datasource,
       super(PostState());

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
    state = state.copyWith(bookmarks: bookmarks);
  }

  @override
  Future<void> init() async {
    await excute(
      action: () async {
        final List<Post> posts = await _repository.findAll();
        final Set<String> bookmarks = await _bookmarkDataSource.findAll();
        state = state.copyWith(posts: posts, bookmarks: bookmarks);
      },
    );
  }
}
