import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/education_model.dart';
import 'package:smart_cv_profile/services/education_storage_service.dart';

class EducationController extends ChangeNotifier {
  List<EducationModel> _educations = [];
  bool _isLoading = false;

  List<EducationModel> get educations => List.unmodifiable(_educations);
  bool get isLoading => _isLoading;
  bool get hasEducation => _educations.isNotEmpty;

  Future<void> loadEducations() async {
    _isLoading = true;
    notifyListeners();

    _educations = await EducationStorageService.loadEducations();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addEducation(EducationModel education) async {
    final newEducation = education.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    _educations.add(newEducation);
    await EducationStorageService.saveEducations(_educations);

    notifyListeners();
  }

  Future<void> updateEducation(EducationModel education) async {
    final index = _educations.indexWhere((item) => item.id == education.id);

    if (index == -1) return;

    _educations[index] = education;
    await EducationStorageService.saveEducations(_educations);

    notifyListeners();
  }

  Future<void> deleteEducation(String id) async {
    _educations.removeWhere((item) => item.id == id);
    await EducationStorageService.saveEducations(_educations);

    notifyListeners();
  }

  Future<void> clearEducations() async {
    _educations.clear();
    await EducationStorageService.clearEducations();

    notifyListeners();
  }
}