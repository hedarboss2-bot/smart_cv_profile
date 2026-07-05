import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cv_profile/models/user_model.dart';

class StorageService {
  static const String userKey = "user_profile";

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user.toMap()));
  }

  static Future<UserModel> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(userKey);

    if (data == null) {
      return const UserModel();
    }

    final map = jsonDecode(data) as Map<String, dynamic>;
    return UserModel.fromMap(map);
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}