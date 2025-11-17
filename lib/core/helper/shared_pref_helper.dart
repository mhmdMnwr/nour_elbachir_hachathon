import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // Private constructor
  SharedPrefHelper._();

  // Singleton instance
  static final SharedPrefHelper instance = SharedPrefHelper._();

  SharedPreferences? _preferences;

  // Initialize SharedPreferences
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Generic method to save data
  Future<bool> setData(String key, dynamic value) async {
    if (_preferences == null) await init();

    if (value is String) {
      return await _preferences!.setString(key, value);
    } else if (value is int) {
      return await _preferences!.setInt(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is bool) {
      return await _preferences!.setBool(key, value);
    } else if (value is List<String>) {
      return await _preferences!.setStringList(key, value);
    }
    return false;
  }

  // Get String
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Get int
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Get double
  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  // Get bool
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // Get List<String>
  List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  // Check if key exists
  bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }

  // Remove specific key
  Future<bool> remove(String key) async {
    if (_preferences == null) await init();
    return await _preferences!.remove(key);
  }

  // Clear all data
  Future<bool> clear() async {
    if (_preferences == null) await init();
    return await _preferences!.clear();
  }

  // Get all keys
  Set<String> getKeys() {
    return _preferences?.getKeys() ?? {};
  }
}
