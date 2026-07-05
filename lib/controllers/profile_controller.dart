import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/identity_level.dart';
import 'package:smart_cv_profile/models/user_model.dart';
import 'package:smart_cv_profile/services/image_service.dart';
import 'package:smart_cv_profile/services/storage_service.dart';

class ProfileController extends ChangeNotifier {
  UserModel _user = const UserModel();
  bool _isLoading = false;

  UserModel get user => _user;
  bool get isLoading => _isLoading;

  double get identityScore {
    int score = 0;

    if (_user.imagePath.isNotEmpty) score += 15;
    if (_user.fullName.isNotEmpty) score += 15;
    if (_user.phone.isNotEmpty) score += 10;
    if (_user.email.isNotEmpty) score += 10;
    if (_user.address.isNotEmpty) score += 10;
    if (_user.country.isNotEmpty) score += 10;
    if (_user.city.isNotEmpty) score += 10;
    if (_user.jobTitle.isNotEmpty) score += 10;
    if (_user.website.isNotEmpty) score += 5;
    if (_user.about.isNotEmpty) score += 5;

    return score / 100;
  }

  int get identityPercent {
    return (identityScore * 100).toInt();
  }

  IdentityLevel get identityLevel {
    final score = identityPercent;

    if (score >= 90) {
      return IdentityLevel.diamond;
    } else if (score >= 70) {
      return IdentityLevel.gold;
    } else if (score >= 45) {
      return IdentityLevel.silver;
    } else {
      return IdentityLevel.bronze;
    }
  }

  String get nextLevelMessage {
    switch (identityLevel) {
      case IdentityLevel.bronze:
        return "Complete your profile to reach Silver.";
      case IdentityLevel.silver:
        return "Add more details to reach Gold.";
      case IdentityLevel.gold:
        return "Almost there! Reach Diamond level.";
      case IdentityLevel.diamond:
        return "Your digital identity is complete.";
    }
  }

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();

    _user = await StorageService.loadUser();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveProfile(UserModel user) async {
    _user = user;
    await StorageService.saveUser(_user);
    notifyListeners();
  }

  Future<void> pickImageFromGallery() async {
    final path = await ImageService.pickFromGallery();
    if (path == null) return;

    _user = _user.copyWith(imagePath: path);
    await StorageService.saveUser(_user);
    notifyListeners();
  }

  Future<void> pickImageFromCamera() async {
    final path = await ImageService.pickFromCamera();
    if (path == null) return;

    _user = _user.copyWith(imagePath: path);
    await StorageService.saveUser(_user);
    notifyListeners();
  }

  Future<void> removeImage() async {
    _user = _user.copyWith(imagePath: '');
    await StorageService.saveUser(_user);
    notifyListeners();
  }
}