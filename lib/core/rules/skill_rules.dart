import 'package:smart_cv_profile/models/skill_model.dart';

class SkillRules {
  SkillRules._();

  static double calculateScore(List<SkillModel> skills) {
    if (skills.isEmpty) return 0.0;

    int score = 40;

    final hasCategory = skills.any(
      (skill) => skill.category.isNotEmpty,
    );

    final hasHighLevel = skills.any(
      (skill) => skill.level >= 80,
    );

    final hasManySkills = skills.length >= 5;

    if (hasCategory) score += 20;
    if (hasHighLevel) score += 20;
    if (hasManySkills) score += 20;

    return score / 100;
  }
}