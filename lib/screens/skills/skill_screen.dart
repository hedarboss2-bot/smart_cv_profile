import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/skill_controller.dart';
import 'package:smart_cv_profile/core/journey/journey_engine.dart';
import 'package:smart_cv_profile/core/journey/journey_module.dart';
import 'package:smart_cv_profile/core/rules/skill_rules.dart';
import 'package:smart_cv_profile/widgets/skill_card.dart';
import 'package:smart_cv_profile/widgets/skill_form.dart';
import 'package:smart_cv_profile/widgets/smart_journey_card.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({super.key});

  List<String> _getInsights(SkillController controller) {
    if (controller.skills.isEmpty) {
      return [
        "No skills added yet",
        "Add your first skill to start your journey",
      ];
    }

    final hasCategory = controller.skills.any(
      (skill) => skill.category.isNotEmpty,
    );

    final hasHighLevel = controller.skills.any(
      (skill) => skill.level >= 80,
    );

    return [
      "${controller.skills.length} skill(s) added",
      hasCategory ? "Skill categories added" : "Skill categories missing",
      hasHighLevel ? "Expert-level skill added" : "Add a skill above 80%",
    ];
  }

  String _getNextGoal(SkillController controller) {
    if (controller.skills.isEmpty) {
      return "Add your first skill";
    }

    final hasCategory = controller.skills.any(
      (skill) => skill.category.isNotEmpty,
    );

    final hasHighLevel = controller.skills.any(
      (skill) => skill.level >= 80,
    );

    if (!hasCategory) return "Add skill categories";
    if (!hasHighLevel) return "Add one skill with 80% or higher";
    if (controller.skills.length < 5) return "Add more skills";

    return "Your skills journey looks strong";
  }

  String _getCoachMessage(double progress) {
    final percent = (progress * 100).toInt();

    if (percent >= 81) {
      return "Excellent! Your skills section looks strong and professional.";
    }

    if (percent >= 61) {
      return "Great progress! Add more high-level skills to reach Expert level.";
    }

    if (percent >= 41) {
      return "You are building a strong skill profile. Add categories and improve skill levels.";
    }

    if (percent >= 21) {
      return "Good start. Add more skills to make this section stronger.";
    }

    return "Start by adding your first skill. This helps Smart CV understand what you can do.";
  }

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
    final progress = SkillRules.calculateScore(controller.skills);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSkillForm(context),
        child: const Icon(Icons.add),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                SmartJourneyCard(
                  title: "Skills",
                  level: JourneyEngine.getLevel(progress),
                  progress: progress,
                  icon: Icons.psychology,
                  insights: _getInsights(controller),
                  nextGoal: _getNextGoal(controller),
                  achievement: JourneyEngine.getAchievement(
                    module: JourneyModule.skills,
                    progress: progress,
                  ),
                  coachMessage: _getCoachMessage(progress),
                  reward: JourneyEngine.getReward(progress),
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