import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/models/experience_model.dart';
import 'package:smart_cv_profile/widgets/experience_card.dart';
import 'package:smart_cv_profile/widgets/experience_form.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ExperienceController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Experience"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return ExperienceForm(
                onSave: (experience) {
                  controller.addExperience(experience);
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.experiences.isEmpty
              ? const Center(
                  child: Text(
                    "No experience added yet.",
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.experiences.length,
                  itemBuilder: (context, index) {
                    final experience = controller.experiences[index];

                    return ExperienceCard(
                      experience: experience,
                      onEdit: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) {
                            return ExperienceForm(
                              experience: experience,
                              onSave: (updatedExperience) {
                                controller.updateExperience(updatedExperience);
                              },
                            );
                          },
                        );
                      },
                      onDelete: () {
                        controller.deleteExperience(experience.id);
                      },
                    );
                  },
                ),
    );
  }
}