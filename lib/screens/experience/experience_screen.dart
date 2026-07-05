import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/widgets/experience_card.dart';
import 'package:smart_cv_profile/widgets/experience_form.dart';
import 'package:smart_cv_profile/widgets/module_score_card.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  double _calculateExperienceScore(ExperienceController controller) {
    if (controller.experiences.isEmpty) return 0.0;

    int score = 40;

    final hasDescription = controller.experiences.any(
      (experience) => experience.description.isNotEmpty,
    );

    final hasLocation = controller.experiences.any(
      (experience) => experience.location.isNotEmpty,
    );

    final hasEmploymentType = controller.experiences.any(
      (experience) => experience.employmentType.isNotEmpty,
    );

    final hasMultipleExperiences = controller.experiences.length >= 2;

    if (hasDescription) score += 20;
    if (hasLocation) score += 15;
    if (hasEmploymentType) score += 10;
    if (hasMultipleExperiences) score += 15;

    return score / 100;
  }

  void _openExperienceForm(BuildContext context, {experience}) {
    final controller = context.read<ExperienceController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return ExperienceForm(
          experience: experience,
          onSave: (savedExperience) {
            if (experience == null) {
              controller.addExperience(savedExperience);
            } else {
              controller.updateExperience(savedExperience);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ExperienceController>();
    final score = _calculateExperienceScore(controller);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Experience"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openExperienceForm(context),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  ModuleScoreCard(
                    title: "Experience Score",
                    subtitle: controller.experiences.isEmpty
                        ? "Add your work experience to increase this score."
                        : "${controller.experiences.length} experience item(s) added.",
                    progress: score,
                    icon: Icons.work,
                  ),

                  const SizedBox(height: 20),

                  if (controller.experiences.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "No experience added yet.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  else
                    ...controller.experiences.map(
                      (experience) => ExperienceCard(
                        experience: experience,
                        onEdit: () {
                          _openExperienceForm(
                            context,
                            experience: experience,
                          );
                        },
                        onDelete: () {
                          controller.deleteExperience(experience.id);
                        },
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}