import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/controllers/skill_controller.dart';

import 'package:smart_cv_profile/core/journey/journey_achievement_engine.dart';
import 'package:smart_cv_profile/core/journey/journey_recommendation_engine.dart';
import 'package:smart_cv_profile/core/journey/journey_xp_engine.dart';
import 'package:smart_cv_profile/core/rules/education_rules.dart';
import 'package:smart_cv_profile/core/rules/experience_rules.dart';
import 'package:smart_cv_profile/core/rules/skill_rules.dart';

import 'package:smart_cv_profile/widgets/common/app_page.dart';
import 'package:smart_cv_profile/widgets/common/app_scaffold.dart';

import 'package:smart_cv_profile/widgets/dashboard/dashboard_achievements_card.dart';
import 'package:smart_cv_profile/widgets/dashboard/dashboard_continue_journey.dart';
import 'package:smart_cv_profile/widgets/dashboard/dashboard_header.dart';
import 'package:smart_cv_profile/widgets/dashboard/dashboard_progress_overview.dart';
import 'package:smart_cv_profile/widgets/dashboard/dashboard_quick_actions.dart';
import 'package:smart_cv_profile/widgets/dashboard/dashboard_recent_activity.dart';
import 'package:smart_cv_profile/widgets/dashboard/dashboard_xp_card.dart';
import 'package:smart_cv_profile/widgets/dashboard/journey_recommendation_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = context.watch<ProfileController>();
    final educationController = context.watch<EducationController>();
    final experienceController = context.watch<ExperienceController>();
    final skillController = context.watch<SkillController>();

    final user = profileController.user;

    final educationProgress = EducationRules.calculateScore(
      educationController.educations,
    );

    final experienceProgress = ExperienceRules.calculateScore(
      experienceController.experiences,
    );

    final skillsProgress = SkillRules.calculateScore(
      skillController.skills,
    );

    final xp = JourneyXPEngine.calculate(
      hasProfile: user.fullName.isNotEmpty,
      educationCount: educationController.educations.length,
      experienceCount: experienceController.experiences.length,
      skillsCount: skillController.skills.length,
    );

    final achievements = JourneyAchievementEngine.getAchievements(
      hasProfile: user.fullName.isNotEmpty,
      educationCount: educationController.educations.length,
      experienceCount: experienceController.experiences.length,
      skillsCount: skillController.skills.length,
    );

    final recommendation =
        JourneyRecommendationEngine.getBestRecommendation(
      educationProgress: educationProgress,
      experienceProgress: experienceProgress,
      skillsProgress: skillsProgress,
    );

    return AppScaffold(
      title: "Smart CV",
      showAppBar: false,
      body: AppPage(
        child: profileController.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardHeader(
                      name: user.fullName,
                    ),

                    const SizedBox(height: 24),

                    DashboardXPCard(
                      xp: xp,
                    ),

                    const SizedBox(height: 24),

                    DashboardAchievementsCard(
                      achievements: achievements,
                    ),

                    const SizedBox(height: 24),

                    DashboardProgressOverview(
                      educationProgress: educationProgress,
                      experienceProgress: experienceProgress,
                      skillsProgress: skillsProgress,
                    ),

                    const SizedBox(height: 28),

                    JourneyRecommendationCard(
                      recommendation: recommendation,
                    ),

                    const SizedBox(height: 28),

                    DashboardContinueJourney(
                      educationProgress: educationProgress,
                      experienceProgress: experienceProgress,
                      skillsProgress: skillsProgress,
                    ),

                    const SizedBox(height: 28),

                    const DashboardRecentActivity(),

                    const SizedBox(height: 28),

                    const DashboardQuickActions(),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
      ),
    );
  }
}