import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/experience_model.dart';
import 'package:smart_cv_profile/widgets/custom_button.dart';
import 'package:smart_cv_profile/widgets/custom_text_field.dart';

class ExperienceForm extends StatefulWidget {
  final ExperienceModel? experience;
  final void Function(ExperienceModel experience) onSave;

  const ExperienceForm({
    super.key,
    this.experience,
    required this.onSave,
  });

  @override
  State<ExperienceForm> createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm> {
  final companyController = TextEditingController();
  final positionController = TextEditingController();
  final employmentTypeController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isCurrent = false;

  @override
  void initState() {
    super.initState();

    final exp = widget.experience;
    if (exp != null) {
      companyController.text = exp.companyName;
      positionController.text = exp.position;
      employmentTypeController.text = exp.employmentType;
      locationController.text = exp.location;
      startDateController.text = exp.startDate;
      endDateController.text = exp.endDate;
      descriptionController.text = exp.description;
      isCurrent = exp.isCurrent;
    }
  }

  @override
  void dispose() {
    companyController.dispose();
    positionController.dispose();
    employmentTypeController.dispose();
    locationController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    final experience = ExperienceModel(
      id: widget.experience?.id ?? '',
      companyName: companyController.text.trim(),
      position: positionController.text.trim(),
      employmentType: employmentTypeController.text.trim(),
      location: locationController.text.trim(),
      startDate: startDateController.text.trim(),
      endDate: endDateController.text.trim(),
      isCurrent: isCurrent,
      description: descriptionController.text.trim(),
    );

    widget.onSave(experience);
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
            widget.experience == null ? "Add Experience" : "Edit Experience",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),

          CustomTextField(
            label: "Company Name",
            icon: Icons.business,
            controller: companyController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Job Title",
            icon: Icons.work,
            controller: positionController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Employment Type",
            icon: Icons.badge,
            controller: employmentTypeController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Location",
            icon: Icons.location_on,
            controller: locationController,
          ),
          const SizedBox(height: 14),

          CustomTextField(
            label: "Start Date",
            icon: Icons.date_range,
            controller: startDateController,
          ),
          const SizedBox(height: 14),

          if (!isCurrent)
            CustomTextField(
              label: "End Date",
              icon: Icons.event,
              controller: endDateController,
            ),

          const SizedBox(height: 10),

          SwitchListTile(
            value: isCurrent,
            title: const Text("I currently work here"),
            onChanged: (value) {
              setState(() {
                isCurrent = value;
              });
            },
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
            title: "Save Experience",
            icon: Icons.save,
            onPressed: _save,
          ),
        ],
      ),
    );
  }
}