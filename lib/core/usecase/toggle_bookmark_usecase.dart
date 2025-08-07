import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';

class ToggleBookmarkUsecase {
  final BookmarkDataSource _dataSource;

  const ToggleBookmarkUsecase({required BookmarkDataSource dataSource})
    : _dataSource = dataSource;

  Future<Set<String>> execute(int postId) async {
    await _dataSource.toggleBookmarkByPostId(postId);

    return await _dataSource.findAll();
  }
}
