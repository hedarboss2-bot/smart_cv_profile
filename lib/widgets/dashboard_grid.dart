import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/widgets/dashboard_card.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _DashboardItem('Profile', Icons.person, AppRoutes.personalInfo),
      _DashboardItem('Education', Icons.school, AppRoutes.education),
      _DashboardItem('Experience', Icons.work, AppRoutes.experience),
      _DashboardItem('Skills', Icons.psychology, AppRoutes.skills),
      _DashboardItem('Gaming', Icons.sports_esports, AppRoutes.gaming),
      _DashboardItem('Devices', Icons.computer, AppRoutes.devices),
      _DashboardItem('Social Links', Icons.share, AppRoutes.social),
      _DashboardItem('CV Preview', Icons.description, AppRoutes.cvPreview),
      _DashboardItem('Export PDF', Icons.picture_as_pdf, AppRoutes.exportPdf),
      _DashboardItem('Settings', Icons.settings, AppRoutes.settings),
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
            if (item.route == AppRoutes.personalInfo) {
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

  const _DashboardItem(this.title, this.icon, this.route);
}