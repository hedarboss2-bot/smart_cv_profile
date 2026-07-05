import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/controllers/education_controller.dart';

import 'package:smart_cv_profile/models/achievement_model.dart';

import 'package:smart_cv_profile/widgets/dashboard_grid.dart';
import 'package:smart_cv_profile/widgets/dashboard_header.dart';
import 'package:smart_cv_profile/widgets/profile_completion_card.dart';
import 'package:smart_cv_profile/widgets/weekly_progress_card.dart';
import 'package:smart_cv_profile/widgets/quick_actions.dart';
import 'package:smart_cv_profile/widgets/section_title.dart';
import 'package:smart_cv_profile/widgets/smart_id_card.dart';
import 'package:smart_cv_profile/widgets/statistics_card.dart';
import 'package:smart_cv_profile/widgets/achievements_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) return "Good Morning 👋";
    if (hour < 18) return "Good Afternoon 👋";
    return "Good Evening 👋";
  }

  @override
  Widget build(BuildContext context) {
    final profileController = context.watch<ProfileController>();
    final educationController = context.watch<EducationController>();

    final user = profileController.user;

    return Scaffold(
      body: SafeArea(
        child: profileController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardHeader(
                      greeting: _getGreeting(),
                      userName: user.fullName,
                      imagePath: user.imagePath,
                    ),
                    const SizedBox(height: 20),

                    ProfileCompletionCard(
                      progress: profileController.identityScore,
                      level: profileController.identityLevel,
                      message: profileController.nextLevelMessage,
                    ),
                    const SizedBox(height: 24),

                    WeeklyProgressCard(
                      progress: profileController.identityScore,
                    ),
                    const SizedBox(height: 24),

                    SmartIdCard(user: user),
                    const SizedBox(height: 24),

                    const QuickActions(),
                    const SizedBox(height: 24),

                    StatisticsCard(
                      profile: profileController.identityPercent,
                      education: educationController.educations.length,
                      gaming: 0,
                      devices: 0,
                    ),
                    const SizedBox(height: 28),

                    AchievementsSection(
                      achievements: [
                        AchievementModel(
                          title: "Profile Completed",
                          description: "Completed your personal profile.",
                          unlocked: profileController.identityPercent >= 80,
                        ),
                        AchievementModel(
                          title: "First Education",
                          description: "Added your first education.",
                          unlocked: educationController.educations.isNotEmpty,
                        ),
                        const AchievementModel(
                          title: "Gaming Profile",
                          description: "Add your gaming accounts.",
                          unlocked: false,
                        ),
                        const AchievementModel(
                          title: "Export PDF",
                          description: "Generate your first CV.",
                          unlocked: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    const SectionTitle(
                      title: "My Dashboard",
                      subtitle: "Manage your digital identity",
                    ),
                    const SizedBox(height: 18),

                    const DashboardGrid(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
      ),
    );
  }
}