import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';

import 'package:smart_cv_profile/core/design/app_radius.dart';
import 'package:smart_cv_profile/core/design/app_spacing.dart';
import 'package:smart_cv_profile/core/journey/journey_module.dart';
import 'package:smart_cv_profile/core/journey/journey_recommendation.dart';

class JourneyRecommendationCard extends StatelessWidget {
  final JourneyRecommendation recommendation;

  const JourneyRecommendationCard({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
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
              "🎯 Smart Recommendation",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              recommendation.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              recommendation.message,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  _route(recommendation.module),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: Text(recommendation.actionText),
            ),
          ],
        ),
      ),
    );
  }

  String _route(JourneyModule module) {
    switch (module) {
      case JourneyModule.education:
        return AppRoutes.education;

      case JourneyModule.experience:
        return AppRoutes.experience;

      case JourneyModule.skills:
        return AppRoutes.skills;

      default:
        return AppRoutes.personalInfo;
    }
  }
}