import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/widgets/education_card.dart';
import 'package:smart_cv_profile/widgets/education_form.dart';
import 'package:smart_cv_profile/widgets/module_score_card.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  double _calculateEducationScore(EducationController controller) {
    if (controller.educations.isEmpty) return 0.0;

    int score = 40;

    final hasDescription = controller.educations.any(
      (education) => education.description.isNotEmpty,
    );

    final hasGrade = controller.educations.any(
      (education) => education.grade.isNotEmpty,
    );

    final hasMultipleEducations = controller.educations.length >= 2;

    if (hasDescription) score += 20;
    if (hasGrade) score += 20;
    if (hasMultipleEducations) score += 20;

    return score / 100;
  }

  void _openEducationForm(BuildContext context, {education}) {
    final controller = context.read<EducationController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return EducationForm(
          education: education,
          onSave: (savedEducation) {
            if (education == null) {
              controller.addEducation(savedEducation);
            } else {
              controller.updateEducation(savedEducation);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EducationController>();
    final score = _calculateEducationScore(controller);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openEducationForm(context),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  ModuleScoreCard(
                    title: "Education Score",
                    subtitle: controller.educations.isEmpty
                        ? "Add your education to increase this score."
                        : "${controller.educations.length} education item(s) added.",
                    score: score,
                    icon: Icons.school,
                  ),

                  const SizedBox(height: 20),

                  if (controller.educations.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "No education added yet.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  else
                    ...controller.educations.map(
                      (education) => EducationCard(
                        education: education,
                        onEdit: () {
                          _openEducationForm(
                            context,
                            education: education,
                          );
                        },
                        onDelete: () {
                          controller.deleteEducation(education.id);
                        },
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}