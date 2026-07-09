import 'journey_module.dart';
import 'journey_recommendation.dart';

class JourneyRecommendationEngine {
  JourneyRecommendationEngine._();

  static JourneyRecommendation getBestRecommendation({
    required double educationProgress,
    required double experienceProgress,
    required double skillsProgress,
  }) {
    if (experienceProgress <= educationProgress &&
        experienceProgress <= skillsProgress) {
      return const JourneyRecommendation(
        module: JourneyModule.experience,
        title: "Continue your career journey",
        message:
            "Your Experience section needs attention. Add job details to improve your professional profile.",
        actionText: "Open Experience",
        priority: 1.0,
      );
    }

    if (skillsProgress <= educationProgress &&
        skillsProgress <= experienceProgress) {
      return const JourneyRecommendation(
        module: JourneyModule.skills,
        title: "Improve your skills profile",
        message:
            "Add more skills or increase skill levels to strengthen your Smart CV.",
        actionText: "Open Skills",
        priority: 0.9,
      );
    }

    return const JourneyRecommendation(
      module: JourneyModule.education,
      title: "Build your education profile",
      message:
          "Add GPA, descriptions, or another education record to improve your learning journey.",
      actionText: "Open Education",
      priority: 0.8,
    );
  }
}