import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommer_app_market/features/auth/data/model/auth_model.dart';

class AuthLocalDatasource {
  static const String _userKey = 'auth_user';

  Future<void> saveUser(AuthModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<AuthModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      try {
        final decoded = jsonDecode(userJson);
        return AuthModel.fromJson(decoded);
      } catch (e) {
        print("Error decoding user from SharedPreferences: $e");
      }
    }
    return null;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
