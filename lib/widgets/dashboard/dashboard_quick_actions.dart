import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/controllers/skill_controller.dart';
import 'package:smart_cv_profile/core/design/app_colors.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_builder.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_exporter.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_generator.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({super.key});

  Future<void> _exportPdf(BuildContext context) async {
    final profileController = context.read<ProfileController>();
    final educationController = context.read<EducationController>();
    final experienceController = context.read<ExperienceController>();
    final skillController = context.read<SkillController>();

    final cv = CvPdfBuilder.build(
      profile: profileController.user,
      educations: educationController.educations,
      experiences: experienceController.experiences,
      skills: skillController.skills,
    );

    final bytes = await CvPdfGenerator.generate(cv);

    await CvPdfExporter.preview(
      (_) async => bytes,
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
                Navigator.pushNamed(context, AppRoutes.cvPreview);
              },
            ),
            _ActionButton(
              title: "Export PDF",
              icon: Icons.picture_as_pdf,
              color: Colors.red,
              onTap: () {
                _exportPdf(context);
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
                backgroundColor: color.withValues(alpha: 0.15),
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