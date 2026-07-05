import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/achievement_model.dart';

class AchievementCard extends StatelessWidget {
  final AchievementModel achievement;

  const AchievementCard({
    super.key,
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: achievement.unlocked
              ? Colors.green
              : Colors.grey.shade400,
          child: Icon(
            achievement.unlocked
                ? Icons.check
                : Icons.lock,
            color: Colors.white,
          ),
        ),
        title: Text(
          achievement.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          achievement.description,
        ),
      ),
    );
  }
}