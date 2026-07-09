import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_radius.dart';
import 'package:smart_cv_profile/core/design/app_spacing.dart';
import 'package:smart_cv_profile/models/journey_achievement_model.dart';

class DashboardAchievementsCard extends StatelessWidget {
  final List<JourneyAchievementModel> achievements;

  const DashboardAchievementsCard({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    final unlocked = achievements.where((a) => a.unlocked).toList();

    return Card(
      color: const Color(0xff1F1F27),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.xl,
      ),
      child: Padding(
        padding: AppSpacing.card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🏆 Achievements",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            if (unlocked.isEmpty)
              const Text(
                "No achievements unlocked yet.",
                style: TextStyle(color: Colors.white70),
              )
            else
              ...unlocked.map(
                (achievement) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber.withValues(alpha: 0.2),
                    child: Icon(
                      achievement.icon,
                      color: Colors.amber,
                    ),
                  ),
                  title: Text(
                    achievement.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    achievement.description,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  trailing: Text(
                    "+${achievement.xpReward} XP",
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}