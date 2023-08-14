import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<int> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    int val = prefs.getInt(key) ?? 0;
    return val;
  }

  save(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }
}
