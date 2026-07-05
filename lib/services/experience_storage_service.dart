import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cv_profile/models/experience_model.dart';

class ExperienceStorageService {
  static const String _storageKey = 'experiences';

  Future<List<ExperienceModel>> loadExperiences() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
        .map((e) => ExperienceModel.fromMap(e))
        .toList();
  }

  Future<void> saveExperiences(
    List<ExperienceModel> experiences,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(
      experiences.map((e) => e.toMap()).toList(),
    );

    await prefs.setString(_storageKey, jsonString);
  }

  Future<void> clearExperiences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}