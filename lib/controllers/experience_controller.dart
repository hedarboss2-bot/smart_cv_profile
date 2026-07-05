import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/experience_model.dart';
import 'package:smart_cv_profile/services/experience_storage_service.dart';

class ExperienceController extends ChangeNotifier {
  final ExperienceStorageService _storageService =
      ExperienceStorageService();

  List<ExperienceModel> _experiences = [];
  bool _isLoading = false;

  List<ExperienceModel> get experiences => List.unmodifiable(_experiences);
  bool get isLoading => _isLoading;
  bool get hasExperience => _experiences.isNotEmpty;

  Future<void> loadExperiences() async {
    _isLoading = true;
    notifyListeners();

    _experiences = await _storageService.loadExperiences();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addExperience(ExperienceModel experience) async {
    final newExperience = experience.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    _experiences.add(newExperience);
    await _storageService.saveExperiences(_experiences);

    notifyListeners();
  }

  Future<void> updateExperience(ExperienceModel experience) async {
    final index = _experiences.indexWhere(
      (item) => item.id == experience.id,
    );

    if (index == -1) return;

    _experiences[index] = experience;
    await _storageService.saveExperiences(_experiences);

    notifyListeners();
  }

  Future<void> deleteExperience(String id) async {
    _experiences.removeWhere((item) => item.id == id);
    await _storageService.saveExperiences(_experiences);

    notifyListeners();
  }

  Future<void> clearExperiences() async {
    _experiences.clear();
    await _storageService.clearExperiences();

    notifyListeners();
  }
}