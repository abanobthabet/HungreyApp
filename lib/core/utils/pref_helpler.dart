import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpler {
  static String keytoken = 'auth_token';

  Future<void> saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(keytoken, token);
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(keytoken);
  }

  Future<void> clearToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(keytoken);
  }
}
