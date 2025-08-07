import 'package:post_bookmark/core/utils/local/data_source/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShrdprefDataSource implements LocalDataSource {
  final SharedPreferences _preferences;

  const ShrdprefDataSource({required SharedPreferences preferences})
    : _preferences = preferences;

  @override
  Future<Set<String>> getAll() async {
    return _preferences.getKeys();
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> setInt(String key, int data) async {
    await _preferences.setInt(key, data);
  }

  @override
  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }
}
