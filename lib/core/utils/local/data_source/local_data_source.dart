abstract interface class LocalDataSource {
  Future<void> setInt(String key, int data);
  Future<Set<String>> getAll();
  Future<void> remove(String key);
  bool containsKey(String key);
}
