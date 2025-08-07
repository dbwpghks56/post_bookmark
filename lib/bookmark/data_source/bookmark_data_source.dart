abstract interface class BookmarkDataSource {
  Future<void> addBookmarkByPostId(int postId);
  Future<void> removeBookmarkByPostId(int postId);
  Future<Set<String>> findAll();
  Future<void> toggleBookmarkByPostId(int postId);
  bool containBookmark(int postId);
}
