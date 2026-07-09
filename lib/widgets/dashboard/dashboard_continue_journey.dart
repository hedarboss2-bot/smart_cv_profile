import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/widgets/dashboard/continue_journey_card.dart';

class DashboardContinueJourney extends StatelessWidget {
  final double educationProgress;
  final double experienceProgress;
  final double skillsProgress;

  const DashboardContinueJourney({
    super.key,
    required this.educationProgress,
    required this.experienceProgress,
    required this.skillsProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Continue Your Journey",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ContinueJourneyCard(
          title: "Education",
          icon: Icons.school,
          progress: educationProgress,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.education);
          },
        ),
        const SizedBox(height: 12),
        ContinueJourneyCard(
          title: "Experience",
          icon: Icons.work,
          progress: experienceProgress,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.experience);
          },
        ),
        const SizedBox(height: 12),
        ContinueJourneyCard(
          title: "Skills",
          icon: Icons.psychology,
          progress: skillsProgress,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.skills);
          },
        ),
      ],
    );
  }
}