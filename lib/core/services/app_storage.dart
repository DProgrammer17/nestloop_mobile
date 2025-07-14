import 'package:shared_preferences/shared_preferences.dart';

abstract class AppStorage {
  ///Set String Preferences
  static Future<void> setStringPrefs({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return;
  }

  ///Get String Preferences
  static Future<String> getStringPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  ///Set Boolean Preferences
  static Future<void> setBoolPrefs({
    required String key,
    required bool value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    return;
  }

  ///Get Boolean Preferences
  static Future<bool> getBoolPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
