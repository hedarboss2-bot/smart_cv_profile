import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/core/design/app_colors.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({super.key});

  void _comingSoon(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$title Coming Soon"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Actions",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.4,
          children: [
            _ActionButton(
              title: "Add Education",
              icon: Icons.school,
              color: Colors.blue,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.education);
              },
            ),
            _ActionButton(
              title: "Add Experience",
              icon: Icons.work,
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.experience);
              },
            ),
            _ActionButton(
              title: "Preview CV",
              icon: Icons.description,
              color: Colors.orange,
              onTap: () {
                _comingSoon(context, "Preview CV");
              },
            ),
            _ActionButton(
              title: "Export PDF",
              icon: Icons.picture_as_pdf,
              color: Colors.red,
              onTap: () {
                _comingSoon(context, "Export PDF");
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff1F1F27),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(.15),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}