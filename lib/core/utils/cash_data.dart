import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static late SharedPreferences sharedPreferences;

  static void cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static void deleteItem({required String key}) async {
    await sharedPreferences.remove(key);
  }

  static void clearItem() async {
    await sharedPreferences.clear();
  }
}

class StringCache {
  static const String emailResetPassword = 'emailResetPassword';
  static const String userEmail = 'userEmail';
  static const String userPassword = 'userPassword';
  static const String isActiveRemember = 'isActiveRemember';
}
