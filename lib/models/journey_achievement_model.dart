import 'package:flutter/material.dart';

class JourneyAchievementModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final int xpReward;
  final bool unlocked;

  const JourneyAchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.xpReward,
    required this.unlocked,
  });
}