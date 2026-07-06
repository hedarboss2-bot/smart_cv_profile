import 'journey_module.dart';

class JourneyAchievementEngine {
  JourneyAchievementEngine._();

  static String getAchievement({
    required JourneyModule module,
    required double progress,
  }) {
    final percent = (progress * 100).toInt();

    switch (module) {
      case JourneyModule.education:
        if (percent >= 81) return "Education Expert";
        if (percent >= 61) return "Education Explorer";
        if (percent >= 41) return "Academic Builder";
        if (percent >= 21) return "Academic Starter";
        return "Start Your Education Journey";

      case JourneyModule.experience:
        if (percent >= 81) return "Career Expert";
        if (percent >= 61) return "Professional Builder";
        if (percent >= 41) return "Career Explorer";
        if (percent >= 21) return "Career Starter";
        return "Start Your Career Journey";

      case JourneyModule.skills:
        if (percent >= 81) return "Skill Master";
        if (percent >= 61) return "Advanced Builder";
        if (percent >= 41) return "Skill Explorer";
        if (percent >= 21) return "Skill Starter";
        return "Start Your Skills Journey";

      case JourneyModule.gaming:
        return "Gaming Journey";

      case JourneyModule.devices:
        return "Device Collector";

      case JourneyModule.social:
        return "Social Explorer";

      case JourneyModule.profile:
        return "Profile Builder";

      case JourneyModule.smartId:
        return "Smart Identity";
    }
  }
}