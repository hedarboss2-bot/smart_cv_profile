import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cv_profile/models/skill_model.dart';

class SkillStorageService {
  static const String _storageKey = 'skills';

  Future<List<SkillModel>> loadSkills() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
        .map((e) => SkillModel.fromMap(e))
        .toList();
  }

  Future<void> saveSkills(List<SkillModel> skills) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(
      skills.map((e) => e.toMap()).toList(),
    );

    await prefs.setString(_storageKey, jsonString);
  }

  Future<void> clearSkills() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}