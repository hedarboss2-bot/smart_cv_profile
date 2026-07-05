import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/models/education_model.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EducationController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addEducation(
            const EducationModel(
              id: '',
              university: 'Example University',
              degree: 'Bachelor',
              fieldOfStudy: 'Computer Science',
              startDate: '2020',
              endDate: '2024',
              isPresent: false,
              grade: 'A',
              description: 'Studied software development and Flutter.',
              certificatePath: '',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.educations.isEmpty
                ? const Center(
                    child: Text(
                      "No education added yet.",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.educations.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final education = controller.educations[index];

                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.school),
                          title: Text(education.university),
                          subtitle: Text(
                            "${education.degree} • ${education.fieldOfStudy}\n${education.startDate} - ${education.isPresent ? 'Present' : education.endDate}",
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteEducation(education.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}