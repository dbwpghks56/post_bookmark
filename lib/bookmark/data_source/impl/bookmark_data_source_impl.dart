import 'dart:async';

import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';
import 'package:post_bookmark/core/utils/local/data_source/local_data_source.dart';

class BookmarkDataSourceImpl implements BookmarkDataSource {
  final LocalDataSource _dataSource;

  const BookmarkDataSourceImpl({required LocalDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<void> addBookmarkByPostId(int postId) async {
    await _dataSource.setInt(postId.toString(), postId);
  }

  @override
  Future<Set<String>> findAll() async {
    return await _dataSource.getAll();
  }

  @override
  Future<void> removeBookmarkByPostId(int postId) async {
    await _dataSource.remove(postId.toString());
  }

  @override
  Future<void> toggleBookmarkByPostId(int postId) async {
    if (_dataSource.containsKey(postId.toString())) {
      removeBookmarkByPostId(postId);
    } else {
      addBookmarkByPostId(postId);
    }
  }

  @override
  bool containBookmark(int postId) {
    return _dataSource.containsKey(postId.toString());
  }
}
