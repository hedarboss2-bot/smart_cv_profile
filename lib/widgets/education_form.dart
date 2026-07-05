import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/education_model.dart';
import 'package:smart_cv_profile/widgets/custom_button.dart';
import 'package:smart_cv_profile/widgets/custom_text_field.dart';

class EducationForm extends StatefulWidget {
  final EducationModel? education;
  final void Function(EducationModel education) onSave;

  const EducationForm({
    super.key,
    this.education,
    required this.onSave,
  });

  @override
  State<EducationForm> createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  final universityController = TextEditingController();
  final degreeController = TextEditingController();
  final fieldController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final gradeController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isPresent = false;

  @override
  void initState() {
    super.initState();

    final edu = widget.education;
    if (edu != null) {
      universityController.text = edu.university;
      degreeController.text = edu.degree;
      fieldController.text = edu.fieldOfStudy;
      startDateController.text = edu.startDate;
      endDateController.text = edu.endDate;
      gradeController.text = edu.grade;
      descriptionController.text = edu.description;
      isPresent = edu.isPresent;
    }
  }

  @override
  void dispose() {
    universityController.dispose();
    degreeController.dispose();
    fieldController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    gradeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    final education = EducationModel(
      id: widget.education?.id ?? '',
      university: universityController.text.trim(),
      degree: degreeController.text.trim(),
      fieldOfStudy: fieldController.text.trim(),
      startDate: startDateController.text.trim(),
      endDate: endDateController.text.trim(),
      isPresent: isPresent,
      grade: gradeController.text.trim(),
      description: descriptionController.text.trim(),
      certificatePath: widget.education?.certificatePath ?? '',
    );

    widget.onSave(education);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.education == null ? "Add Education" : "Edit Education",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),

          CustomTextField(
            label: "University / School",
            icon: Icons.school,
            controller: universityController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Degree",
            icon: Icons.workspace_premium,
            controller: degreeController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Field of Study",
            icon: Icons.menu_book,
            controller: fieldController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Start Date",
            icon: Icons.date_range,
            controller: startDateController,
          ),
          const SizedBox(height: 14),

          if (!isPresent)
            CustomTextField(
              label: "End Date",
              icon: Icons.event,
              controller: endDateController,
            ),

          const SizedBox(height: 10),

          SwitchListTile(
            value: isPresent,
            title: const Text("I am currently studying here"),
            onChanged: (value) {
              setState(() {
                isPresent = value;
              });
            },
          ),

          const SizedBox(height: 14),

          CustomTextField(
            label: "Grade / GPA",
            icon: Icons.grade,
            controller: gradeController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Description",
            icon: Icons.description,
            maxLines: 4,
            controller: descriptionController,
          ),

          const SizedBox(height: 24),

          CustomButton(
            title: "Save Education",
            icon: Icons.save,
            onPressed: _save,
          ),
        ],
      ),
    );
  }
}