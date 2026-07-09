import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  final String name;

  const DashboardHeader({
    super.key,
    required this.name,
  });

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) return "Good Morning";
    if (hour < 18) return "Good Afternoon";
    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _greeting(),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                name.isEmpty ? "Welcome 👋" : "Hi, $name 👋",
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Keep building your professional identity.",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}