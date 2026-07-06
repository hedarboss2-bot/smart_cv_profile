import 'package:smart_cv_profile/models/experience_model.dart';

class ExperienceRules {
  ExperienceRules._();

  static double calculateScore(List<ExperienceModel> experiences) {
    if (experiences.isEmpty) return 0.0;

    int score = 40;

    final hasDescription = experiences.any(
      (experience) => experience.description.isNotEmpty,
    );

    final hasLocation = experiences.any(
      (experience) => experience.location.isNotEmpty,
    );

    final hasEmploymentType = experiences.any(
      (experience) => experience.employmentType.isNotEmpty,
    );

    final hasMultipleExperiences = experiences.length >= 2;

    if (hasDescription) score += 20;
    if (hasLocation) score += 15;
    if (hasEmploymentType) score += 10;
    if (hasMultipleExperiences) score += 15;

    return score / 100;
  }
}