import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/core/rules/experience_rules.dart';
import 'package:smart_cv_profile/widgets/experience_card.dart';
import 'package:smart_cv_profile/widgets/experience_form.dart';
import 'package:smart_cv_profile/widgets/smart_journey_card.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  String _getLevel(double progress) {
    final percent = (progress * 100).toInt();

    if (percent >= 81) return "Expert ⭐⭐⭐⭐⭐";
    if (percent >= 61) return "Advanced ⭐⭐⭐⭐☆";
    if (percent >= 41) return "Intermediate ⭐⭐⭐☆☆";
    if (percent >= 21) return "Elementary ⭐⭐☆☆☆";
    return "Beginner ⭐☆☆☆☆";
  }

  List<String> _getInsights(ExperienceController controller) {
    if (controller.experiences.isEmpty) {
      return [
        "No work experience yet",
        "Add your first job to start your career journey",
      ];
    }

    final hasDescription = controller.experiences.any(
      (experience) => experience.description.isNotEmpty,
    );

    final hasLocation = controller.experiences.any(
      (experience) => experience.location.isNotEmpty,
    );

    final hasEmploymentType = controller.experiences.any(
      (experience) => experience.employmentType.isNotEmpty,
    );

    return [
      "${controller.experiences.length} experience record(s) added",
      hasDescription ? "Job description added" : "Job description missing",
      hasLocation ? "Work location added" : "Work location missing",
      hasEmploymentType ? "Employment type added" : "Employment type missing",
    ];
  }

  String _getNextGoal(ExperienceController controller) {
    if (controller.experiences.isEmpty) {
      return "Add your first work experience";
    }

    final hasDescription = controller.experiences.any(
      (experience) => experience.description.isNotEmpty,
    );

    final hasLocation = controller.experiences.any(
      (experience) => experience.location.isNotEmpty,
    );

    final hasEmploymentType = controller.experiences.any(
      (experience) => experience.employmentType.isNotEmpty,
    );

    if (!hasDescription) return "Add job description";
    if (!hasLocation) return "Add work location";
    if (!hasEmploymentType) return "Add employment type";
    if (controller.experiences.length < 2) return "Add another experience";

    return "Your career journey looks strong";
  }

  String _getAchievement(double progress) {
    final percent = (progress * 100).toInt();

    if (percent >= 81) return "Career Expert";
    if (percent >= 61) return "Professional Builder";
    if (percent >= 41) return "Career Explorer";
    if (percent >= 21) return "Career Starter";
    return "Start Your Career Journey";
  }

  String _getCoachMessage(double progress) {
    final percent = (progress * 100).toInt();

    if (percent >= 81) {
      return "Excellent work! Your experience section looks strong and professional.";
    }

    if (percent >= 61) {
      return "Great progress! Add any missing details to reach Expert level.";
    }

    if (percent >= 41) {
      return "You are building a good career profile. Add descriptions and work details to make it stronger.";
    }

    if (percent >= 21) {
      return "Good start. Add more details about your work experience to improve this section.";
    }

    return "Start by adding your first work experience. This helps Smart CV understand your professional background.";
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
    final progress = ExperienceRules.calculateScore(controller.experiences);

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
                  SmartJourneyCard(
                    title: "Experience",
                    level: _getLevel(progress),
                    progress: progress,
                    icon: Icons.work,
                    insights: _getInsights(controller),
                    nextGoal: _getNextGoal(controller),
                    achievement: _getAchievement(progress),
                    coachMessage: _getCoachMessage(progress),
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