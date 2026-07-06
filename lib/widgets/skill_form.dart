import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/skill_model.dart';
import 'package:smart_cv_profile/widgets/custom_button.dart';
import 'package:smart_cv_profile/widgets/custom_text_field.dart';

class SkillForm extends StatefulWidget {
  final SkillModel? skill;
  final void Function(SkillModel skill) onSave;

  const SkillForm({
    super.key,
    this.skill,
    required this.onSave,
  });

  @override
  State<SkillForm> createState() => _SkillFormState();
}

class _SkillFormState extends State<SkillForm> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();

  double level = 50;

  @override
  void initState() {
    super.initState();

    final skill = widget.skill;
    if (skill != null) {
      nameController.text = skill.name;
      categoryController.text = skill.category;
      descriptionController.text = skill.description;
      level = skill.level.toDouble();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    final skill = SkillModel(
      id: widget.skill?.id ?? '',
      name: nameController.text.trim(),
      category: categoryController.text.trim(),
      level: level.toInt(),
      description: descriptionController.text.trim(),
    );

    widget.onSave(skill);
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
            widget.skill == null ? "Add Skill" : "Edit Skill",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 20),

          CustomTextField(
            label: "Skill Name",
            icon: Icons.psychology,
            controller: nameController,
          ),

          const SizedBox(height: 14),

          CustomTextField(
            label: "Category",
            icon: Icons.category,
            controller: categoryController,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const Text(
                "Skill Level",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text("${level.toInt()}%"),
            ],
          ),

          Slider(
            value: level,
            min: 0,
            max: 100,
            divisions: 20,
            label: "${level.toInt()}%",
            onChanged: (value) {
              setState(() {
                level = value;
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
            title: "Save Skill",
            icon: Icons.save,
            onPressed: _save,
          ),
        ],
      ),
    );
  }
}