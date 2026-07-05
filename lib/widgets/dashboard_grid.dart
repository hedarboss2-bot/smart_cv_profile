import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/widgets/dashboard_card.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _DashboardItem('Profile', Icons.person, AppRoutes.personalInfo, true),
      _DashboardItem('Education', Icons.school, AppRoutes.education, true),
      _DashboardItem('Experience', Icons.work, AppRoutes.experience, true),
      _DashboardItem('Skills', Icons.psychology, AppRoutes.skills, false),
      _DashboardItem('Gaming', Icons.sports_esports, AppRoutes.gaming, false),
      _DashboardItem('Devices', Icons.computer, AppRoutes.devices, false),
      _DashboardItem('Social Links', Icons.share, AppRoutes.social, false),
      _DashboardItem('CV Preview', Icons.description, AppRoutes.cvPreview, false),
      _DashboardItem('Export PDF', Icons.picture_as_pdf, AppRoutes.exportPdf, false),
      _DashboardItem('Settings', Icons.settings, AppRoutes.settings, false),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        return DashboardCard(
          title: item.title,
          icon: item.icon,
          onTap: () {
            if (item.isReady) {
              Navigator.pushNamed(context, item.route);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${item.title} Coming Soon"),
                ),
              );
            }
          },
        );
      },
    );
  }
}

class _DashboardItem {
  final String title;
  final IconData icon;
  final String route;
  final bool isReady;

  const _DashboardItem(
    this.title,
    this.icon,
    this.route,
    this.isReady,
  );
}