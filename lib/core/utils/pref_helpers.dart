import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static const String userTokenKey = 'user_token';


  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userTokenKey, token);
  }

  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTokenKey);
  }
  static Future<void> clearUserToken() async {
    final prefs = await SharedPreferences.getInstance();
   prefs.remove(userTokenKey);
  }
}