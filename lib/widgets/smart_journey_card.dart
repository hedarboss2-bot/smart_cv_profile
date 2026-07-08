import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_gradients.dart';
import 'package:smart_cv_profile/core/design/app_radius.dart';
import 'package:smart_cv_profile/core/design/app_shadows.dart';
import 'package:smart_cv_profile/core/design/app_spacing.dart';
import 'package:smart_cv_profile/widgets/journey/journey_achievement.dart';
import 'package:smart_cv_profile/widgets/journey/journey_coach.dart';
import 'package:smart_cv_profile/widgets/journey/journey_goal.dart';
import 'package:smart_cv_profile/widgets/journey/journey_header.dart';
import 'package:smart_cv_profile/widgets/journey/journey_insights.dart';
import 'package:smart_cv_profile/widgets/journey/journey_progress.dart';

class SmartJourneyCard extends StatelessWidget {
  final String title;
  final String level;
  final double progress;
  final IconData icon;
  final List<String> insights;
  final String nextGoal;
  final String achievement;
  final String coachMessage;
  final String reward;

  const SmartJourneyCard({
    super.key,
    required this.title,
    required this.level,
    required this.progress,
    required this.icon,
    required this.insights,
    required this.nextGoal,
    required this.achievement,
    required this.coachMessage,
    this.reward = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.card,
      decoration: BoxDecoration(
        borderRadius: AppRadius.xl,
        gradient: AppGradients.premium,
        boxShadow: AppShadows.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JourneyHeader(
            title: title,
            level: level,
            progress: progress,
            icon: icon,
          ),
          const SizedBox(height: AppSpacing.xxl),

          JourneyProgress(progress: progress),
          const SizedBox(height: AppSpacing.xxl),

          JourneyCoach(message: coachMessage),
          const SizedBox(height: AppSpacing.lg),

          JourneyInsights(insights: insights),
          const SizedBox(height: AppSpacing.lg),

          JourneyGoal(
            goal: nextGoal,
            reward: reward,
          ),
          const SizedBox(height: AppSpacing.md),

          JourneyAchievement(title: achievement),
        ],
      ),
    );
  }
}