import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [
            Color(0xff111827),
            Color(0xff1E3A8A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
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
          const SizedBox(height: 22),

          JourneyProgress(progress: progress),
          const SizedBox(height: 22),

          JourneyCoach(message: coachMessage),
          const SizedBox(height: 18),

          JourneyInsights(insights: insights),
          const SizedBox(height: 16),

          JourneyGoal(
            goal: nextGoal,
            reward: reward,
          ),
          const SizedBox(height: 14),

          JourneyAchievement(title: achievement),
        ],
      ),
    );
  }
}