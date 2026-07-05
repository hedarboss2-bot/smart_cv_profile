import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cv_profile/models/education_model.dart';

class EducationStorageService {
  static const String _key = "educations";

  static Future<void> saveEducations(
      List<EducationModel> educations) async {
    final prefs = await SharedPreferences.getInstance();

    final list = educations.map((e) => e.toMap()).toList();

    await prefs.setString(
      _key,
      jsonEncode(list),
    );
  }

  static Future<List<EducationModel>> loadEducations() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_key);

    if (data == null) return [];

    final decoded = jsonDecode(data) as List;

    return decoded
        .map((e) => EducationModel.fromMap(e))
        .toList();
  }

  static Future<void> clearEducations() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}