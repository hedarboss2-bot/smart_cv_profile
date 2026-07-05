import 'package:flutter/material.dart';
import 'package:smart_cv_profile/models/education_model.dart';

class EducationCard extends StatelessWidget {
  final EducationModel education;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const EducationCard({
    super.key,
    required this.education,
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
                  Icons.school,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    education.university,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        onEdit?.call();
                        break;
                      case 'delete':
                        onDelete?.call();
                        break;
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
              education.degree,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 6),
            Text(education.fieldOfStudy),
            const SizedBox(height: 6),
            Text(
              education.isPresent
                  ? "${education.startDate} - Present"
                  : "${education.startDate} - ${education.endDate}",
            ),
            if (education.grade.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text("Grade: ${education.grade}"),
            ],
            if (education.description.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(education.description),
            ],
          ],
        ),
      ),
    );
  }
}