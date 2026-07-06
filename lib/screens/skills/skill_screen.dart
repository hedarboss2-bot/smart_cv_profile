import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/skill_controller.dart';
import 'package:smart_cv_profile/core/rules/skill_rules.dart';
import 'package:smart_cv_profile/widgets/module_score_card.dart';
import 'package:smart_cv_profile/widgets/skill_card.dart';
import 'package:smart_cv_profile/widgets/skill_form.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({super.key});

  void _openSkillForm(BuildContext context, {skill}) {
    final controller = context.read<SkillController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return SkillForm(
          skill: skill,
          onSave: (savedSkill) {
            if (skill == null) {
              controller.addSkill(savedSkill);
            } else {
              controller.updateSkill(savedSkill);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SkillController>();

    final progress = SkillRules.calculateScore(
      controller.skills,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSkillForm(context),
        child: const Icon(Icons.add),
      ),
      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ModuleScoreCard(
                  title: "Skills Score",
                  subtitle: controller.skills.isEmpty
                      ? "Add your skills to improve your score."
                      : "${controller.skills.length} skill(s) added",
                  progress: progress,
                  icon: Icons.psychology,
                ),

                const SizedBox(height: 20),

                if (controller.skills.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "No skills added yet.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                else
                  ...controller.skills.map(
                    (skill) => SkillCard(
                      skill: skill,
                      onEdit: () {
                        _openSkillForm(
                          context,
                          skill: skill,
                        );
                      },
                      onDelete: () {
                        controller.deleteSkill(skill.id);
                      },
                    ),
                  ),
              ],
            ),
    );
  }
}