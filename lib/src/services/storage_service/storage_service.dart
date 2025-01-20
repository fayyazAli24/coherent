import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  Future<void> write(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<dynamic>? read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get(key);
    return value;
  }

  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }
}
