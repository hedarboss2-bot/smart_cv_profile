import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/controllers/skill_controller.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_builder.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_exporter.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_generator.dart';
import 'package:smart_cv_profile/widgets/common/app_page.dart';
import 'package:smart_cv_profile/widgets/common/app_scaffold.dart';

class CvPreviewScreen extends StatelessWidget {
  const CvPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = context.watch<ProfileController>();
    final educationController = context.watch<EducationController>();
    final experienceController = context.watch<ExperienceController>();
    final skillController = context.watch<SkillController>();

    final cv = CvPdfBuilder.build(
      profile: profileController.user,
      educations: educationController.educations,
      experiences: experienceController.experiences,
      skills: skillController.skills,
    );

    final user = cv.profile;

    return AppScaffold(
      title: "CV Preview",
      actions: [
        IconButton(
          icon: const Icon(Icons.picture_as_pdf),
          onPressed: () async {
            final bytes = await CvPdfGenerator.generate(cv);

            await CvPdfExporter.preview(
              (_) async => bytes,
            );
          },
        ),
      ],
      body: AppPage(
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName.isEmpty ? "Your Name" : user.fullName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(user.jobTitle.isEmpty ? "Job Title" : user.jobTitle),
                  const SizedBox(height: 10),
                  Text(user.email.isEmpty ? "email@example.com" : user.email),
                  Text(user.phone.isEmpty ? "+000 000 0000" : user.phone),
                  Text(
                    user.city.isEmpty && user.country.isEmpty
                        ? "Your Address"
                        : "${user.city}, ${user.country}",
                  ),

                  const SizedBox(height: 24),

                  _SectionTitle("Education"),
                  if (cv.educations.isEmpty)
                    const Text("No education added yet.")
                  else
                    ...cv.educations.map(
                      (education) => _ItemBlock(
                        title: education.university,
                        subtitle:
                            "${education.degree} • ${education.fieldOfStudy}",
                        trailing: education.isPresent
                            ? "${education.startDate} - Present"
                            : "${education.startDate} - ${education.endDate}",
                        description: education.description,
                      ),
                    ),

                  const SizedBox(height: 20),

                  _SectionTitle("Experience"),
                  if (cv.experiences.isEmpty)
                    const Text("No experience added yet.")
                  else
                    ...cv.experiences.map(
                      (experience) => _ItemBlock(
                        title: experience.position,
                        subtitle:
                            "${experience.companyName} • ${experience.location}",
                        trailing: experience.isCurrent
                            ? "${experience.startDate} - Present"
                            : "${experience.startDate} - ${experience.endDate}",
                        description: experience.description,
                      ),
                    ),

                  const SizedBox(height: 20),

                  _SectionTitle("Skills"),
                  if (cv.skills.isEmpty)
                    const Text("No skills added yet.")
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: cv.skills
                          .map(
                            (skill) => Chip(
                              label: Text("${skill.name} ${skill.level}%"),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ItemBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final String description;

  const _ItemBlock({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.isEmpty ? "Untitled" : title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(subtitle),
          if (trailing.trim().isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(trailing),
          ],
          if (description.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(description),
          ],
        ],
      ),
    );
  }
}