import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_colors.dart';

class DashboardRecentActivity extends StatelessWidget {
  const DashboardRecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      const _ActivityItem(
        title: "Profile updated",
        subtitle: "Your identity information is ready",
        icon: Icons.person,
      ),
      const _ActivityItem(
        title: "Education progress",
        subtitle: "Keep improving your learning journey",
        icon: Icons.school,
      ),
      const _ActivityItem(
        title: "Skills journey",
        subtitle: "Add more skills to strengthen your profile",
        icon: Icons.psychology,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Activity",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...activities.map(
          (item) => Card(
            color: const Color(0xff1F1F27),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  item.icon,
                  color: Colors.white,
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                item.subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActivityItem {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ActivityItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}