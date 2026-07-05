import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ExperienceCard({
    super.key,
    required this.experience,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.work,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    experience.position,
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

            const SizedBox(height: 10),

            Text(
              experience.companyName,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              experience.location,
            ),

            const SizedBox(height: 8),

            Text(
              experience.isCurrent
                  ? "${experience.startDate} - Present"
                  : "${experience.startDate} - ${experience.endDate}",
            ),

            if (experience.description.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(experience.description),
            ],
          ],
        ),
      ),
    );
  }
}