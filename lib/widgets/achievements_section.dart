import 'package:flutter/material.dart';
import 'package:smart_cv_profile/models/achievement_model.dart';
import 'package:smart_cv_profile/widgets/achievement_card.dart';

class AchievementsSection extends StatelessWidget {
  final List<AchievementModel> achievements;

  const AchievementsSection({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Achievements",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 14),
        Column(
          children: achievements
              .map(
                (achievement) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AchievementCard(
                    achievement: achievement,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}