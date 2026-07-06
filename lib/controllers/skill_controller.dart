import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/skill_model.dart';
import 'package:smart_cv_profile/services/skill_storage_service.dart';

class SkillController extends ChangeNotifier {
  final SkillStorageService _storageService = SkillStorageService();

  List<SkillModel> _skills = [];
  bool _isLoading = false;

  List<SkillModel> get skills => List.unmodifiable(_skills);
  bool get isLoading => _isLoading;
  bool get hasSkills => _skills.isNotEmpty;

  Future<void> loadSkills() async {
    _isLoading = true;
    notifyListeners();

    _skills = await _storageService.loadSkills();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addSkill(SkillModel skill) async {
    final newSkill = skill.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    _skills.add(newSkill);
    await _storageService.saveSkills(_skills);

    notifyListeners();
  }

  Future<void> updateSkill(SkillModel skill) async {
    final index = _skills.indexWhere((item) => item.id == skill.id);

    if (index == -1) return;

    _skills[index] = skill;
    await _storageService.saveSkills(_skills);

    notifyListeners();
  }

  Future<void> deleteSkill(String id) async {
    _skills.removeWhere((item) => item.id == id);
    await _storageService.saveSkills(_skills);

    notifyListeners();
  }

  Future<void> clearSkills() async {
    _skills.clear();
    await _storageService.clearSkills();

    notifyListeners();
  }
}