import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/skill_model.dart';

class SkillCard extends StatelessWidget {
  final SkillModel skill;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SkillCard({
    super.key,
    required this.skill,
    this.onEdit,
    this.onDelete,
  });

  Color _levelColor(int level) {
    if (level >= 80) return Colors.green;
    if (level >= 60) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final color = _levelColor(skill.level);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.psychology, size: 28),
                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    skill.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      onEdit?.call();
                    } else if (value == 'delete') {
                      onDelete?.call();
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              skill.category,
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),

            const SizedBox(height: 14),

            LinearProgressIndicator(
              value: skill.level / 100,
              minHeight: 8,
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${skill.level}%",
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            if (skill.description.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(skill.description),
            ],
          ],
        ),
      ),
    );
  }
}