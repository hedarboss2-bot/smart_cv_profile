import 'package:flutter/material.dart';

import 'package:smart_cv_profile/app/routes.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Actions",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 95,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              QuickActionButton(
                title: "New CV",
                icon: Icons.description,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Coming Soon"),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              QuickActionButton(
                title: "Share",
                icon: Icons.share,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.smartId,
                  );
                },
              ),
              const SizedBox(width: 12),
              QuickActionButton(
                title: "PDF",
                icon: Icons.picture_as_pdf,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("PDF Builder Coming Soon"),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              QuickActionButton(
                title: "Smart ID",
                icon: Icons.badge,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.smartId,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}