import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/journey_achievement_model.dart';

class JourneyAchievementEngine {
  JourneyAchievementEngine._();

  static List<JourneyAchievementModel> getAchievements({
    required bool hasProfile,
    required int educationCount,
    required int experienceCount,
    required int skillsCount,
  }) {
    return [
      JourneyAchievementModel(
        id: "profile_started",
        title: "Identity Started",
        description: "Complete your basic profile information.",
        icon: Icons.person,
        xpReward: 20,
        unlocked: hasProfile,
      ),
      JourneyAchievementModel(
        id: "first_education",
        title: "First Education",
        description: "Add your first education record.",
        icon: Icons.school,
        xpReward: 25,
        unlocked: educationCount >= 1,
      ),
      JourneyAchievementModel(
        id: "career_starter",
        title: "Career Starter",
        description: "Add your first work experience.",
        icon: Icons.work,
        xpReward: 30,
        unlocked: experienceCount >= 1,
      ),
      JourneyAchievementModel(
        id: "first_skill",
        title: "First Skill",
        description: "Add your first skill.",
        icon: Icons.psychology,
        xpReward: 10,
        unlocked: skillsCount >= 1,
      ),
      JourneyAchievementModel(
        id: "core_builder",
        title: "Core Builder",
        description: "Add profile, education, experience, and skills.",
        icon: Icons.emoji_events,
        xpReward: 50,
        unlocked: hasProfile &&
            educationCount >= 1 &&
            experienceCount >= 1 &&
            skillsCount >= 1,
      ),
    ];
  }
}