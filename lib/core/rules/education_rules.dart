import 'package:smart_cv_profile/models/education_model.dart';

class EducationRules {
  EducationRules._();

  static double calculateScore(List<EducationModel> educations) {
    if (educations.isEmpty) return 0.0;

    int score = 40;

    final hasDescription = educations.any(
      (education) => education.description.isNotEmpty,
    );

    final hasGrade = educations.any(
      (education) => education.grade.isNotEmpty,
    );

    final hasMultipleEducations = educations.length >= 2;

    if (hasDescription) score += 20;
    if (hasGrade) score += 20;
    if (hasMultipleEducations) score += 20;

    return score / 100;
  }
}