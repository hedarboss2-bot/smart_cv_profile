import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/widgets/education_card.dart';
import 'package:smart_cv_profile/widgets/education_form.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

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
            : controller.educations.isEmpty
                ? const Center(
                    child: Text(
                      "No education added yet.",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.educations.length,
                    itemBuilder: (context, index) {
                      final education = controller.educations[index];

                      return EducationCard(
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
                      );
                    },
                  ),
      ),
    );
  }
}