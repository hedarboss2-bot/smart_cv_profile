import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_radius.dart';
import 'package:smart_cv_profile/core/design/app_spacing.dart';
import 'package:smart_cv_profile/core/journey/journey_xp.dart';

class DashboardXPCard extends StatelessWidget {
  final int xp;

  const DashboardXPCard({
    super.key,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    final level = JourneyXP.level(xp);
    final currentXP = JourneyXP.currentLevelXP(xp);
    final nextXP = JourneyXP.nextLevelXP(xp);
    final progress = JourneyXP.progress(xp);

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
              "⭐ Your Level",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Level $level",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "$currentXP / $nextXP XP",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: AppRadius.pill,
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}