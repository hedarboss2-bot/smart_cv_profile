import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_colors.dart';
import 'package:smart_cv_profile/core/design/app_radius.dart';
import 'package:smart_cv_profile/core/design/app_spacing.dart';

class ContinueJourneyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double progress;
  final VoidCallback onTap;

  const ContinueJourneyCard({
    super.key,
    required this.title,
    required this.icon,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Card(
      color: const Color(0xff1F1F27),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.lg,
      ),
      child: InkWell(
        borderRadius: AppRadius.lg,
        onTap: onTap,
        child: Padding(
          padding: AppSpacing.card,
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.primary.withOpacity(.15),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 7,
                      backgroundColor: Colors.white24,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                "$percent%",
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}