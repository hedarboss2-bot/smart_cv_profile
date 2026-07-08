import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/core/journey/journey_engine.dart';
import 'package:smart_cv_profile/core/journey/journey_module.dart';
import 'package:smart_cv_profile/core/rules/education_rules.dart';

import 'package:smart_cv_profile/widgets/common/app_page.dart';
import 'package:smart_cv_profile/widgets/common/app_scaffold.dart';

import 'package:smart_cv_profile/widgets/education_card.dart';
import 'package:smart_cv_profile/widgets/education_form.dart';
import 'package:smart_cv_profile/widgets/smart_journey_card.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  List<String> _getInsights(EducationController controller) {
    if (controller.educations.isEmpty) {
      return [
        "No education records yet",
        "Add your first education record",
      ];
    }

    final hasGrade = controller.educations.any(
      (e) => e.grade.isNotEmpty,
    );

    final hasDescription = controller.educations.any(
      (e) => e.description.isNotEmpty,
    );

    return [
      "${controller.educations.length} education record(s)",
      hasGrade ? "Grade / GPA added" : "Grade / GPA missing",
      hasDescription
          ? "Description added"
          : "Description missing",
    ];
  }

  String _getNextGoal(EducationController controller) {
    if (controller.educations.isEmpty) {
      return "Add your first education record";
    }

    final hasGrade = controller.educations.any(
      (e) => e.grade.isNotEmpty,
    );

    final hasDescription = controller.educations.any(
      (e) => e.description.isNotEmpty,
    );

    if (!hasGrade) return "Add Grade / GPA";
    if (!hasDescription) return "Add Description";
    if (controller.educations.length < 2) {
      return "Add another education";
    }

    return "Your education profile looks great!";
  }

  String _getCoachMessage(double progress) {
    final percent = (progress * 100).toInt();

    if (percent >= 81) {
      return "Excellent work! Your education profile looks professional.";
    }

    if (percent >= 61) {
      return "Great progress! Add the remaining details to reach Expert level.";
    }

    if (percent >= 41) {
      return "Good progress. Add GPA and descriptions to strengthen your profile.";
    }

    if (percent >= 21) {
      return "Good start. Continue adding education details.";
    }

    return "Start by adding your first education record.";
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
    final progress = EducationRules.calculateScore(
      controller.educations,
    );

    return AppScaffold(
      title: "Education",
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openEducationForm(context),
        child: const Icon(Icons.add),
      ),
      body: AppPage(
        child: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  SmartJourneyCard(
                    title: "Education",
                    level: JourneyEngine.getLevel(progress),
                    progress: progress,
                    icon: Icons.school,
                    insights: _getInsights(controller),
                    nextGoal: _getNextGoal(controller),
                    achievement: JourneyEngine.getAchievement(
                      module: JourneyModule.education,
                      progress: progress,
                    ),
                    coachMessage: _getCoachMessage(progress),
                    reward: JourneyEngine.getReward(progress),
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
                      (education) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: EducationCard(
                          education: education,
                          onEdit: () {
                            _openEducationForm(
                              context,
                              education: education,
                            );
                          },
                          onDelete: () {
                            controller.deleteEducation(
                              education.id,
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}