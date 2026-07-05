import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/experience_controller.dart';
import 'package:smart_cv_profile/models/experience_model.dart';
import 'package:smart_cv_profile/widgets/experience_card.dart';

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
          controller.addExperience(
            const ExperienceModel(
              id: '',
              companyName: 'Example Company',
              position: 'Flutter Developer',
              employmentType: 'Full-time',
              location: 'Erbil, Iraq',
              startDate: '2023',
              endDate: '2025',
              isCurrent: false,
              description: 'Worked on mobile app development using Flutter.',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.experiences.isEmpty
                ? const Center(
                    child: Text(
                      "No experience added yet.",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.experiences.length,
                    itemBuilder: (context, index) {
                      final experience = controller.experiences[index];

                      return ExperienceCard(
                        experience: experience,
                        onDelete: () {
                          controller.deleteExperience(experience.id);
                        },
                      );
                    },
                  ),
      ),
    );
  }
}