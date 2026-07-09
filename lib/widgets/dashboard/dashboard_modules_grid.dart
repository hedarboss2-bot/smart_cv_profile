import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/core/design/app_colors.dart';

class DashboardModulesGrid extends StatelessWidget {
  const DashboardModulesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      _DashboardModule(
        title: "Profile",
        icon: Icons.person,
        color: const Color(0xff3B82F6),
        route: AppRoutes.personalInfo,
        isReady: true,
      ),
      _DashboardModule(
        title: "Education",
        icon: Icons.school,
        color: const Color(0xff10B981),
        route: AppRoutes.education,
        isReady: true,
      ),
      _DashboardModule(
        title: "Experience",
        icon: Icons.work,
        color: const Color(0xffF59E0B),
        route: AppRoutes.experience,
        isReady: true,
      ),
      _DashboardModule(
        title: "Skills",
        icon: Icons.psychology,
        color: const Color(0xff8B5CF6),
        route: AppRoutes.skills,
        isReady: true,
      ),
      _DashboardModule(
        title: "Gaming",
        icon: Icons.sports_esports,
        color: const Color(0xffEF4444),
        route: AppRoutes.gaming,
        isReady: false,
      ),
      _DashboardModule(
        title: "Devices",
        icon: Icons.devices,
        color: const Color(0xff06B6D4),
        route: AppRoutes.devices,
        isReady: false,
      ),
      _DashboardModule(
        title: "Social",
        icon: Icons.public,
        color: const Color(0xffEC4899),
        route: AppRoutes.social,
        isReady: false,
      ),
      _DashboardModule(
        title: "Smart ID",
        icon: Icons.badge,
        color: const Color(0xff6366F1),
        route: AppRoutes.smartId,
        isReady: true,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Modules",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: modules.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.25,
          ),
          itemBuilder: (_, index) {
            final module = modules[index];

            return Card(
              color: const Color(0xff1F1F27),
              elevation: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: () {
                  if (module.isReady) {
                    Navigator.pushNamed(context, module.route);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${module.title} Coming Soon"),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: module.color.withOpacity(.15),
                        child: Icon(
                          module.icon,
                          color: module.color,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        module.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _DashboardModule {
  final String title;
  final IconData icon;
  final Color color;
  final String route;
  final bool isReady;

  const _DashboardModule({
    required this.title,
    required this.icon,
    required this.color,
    required this.route,
    required this.isReady,
  });
}