import 'package:flutter/material.dart';

class WeeklyProgressCard extends StatelessWidget {
  final double progress;

  const WeeklyProgressCard({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toStringAsFixed(0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Progress",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "$percent% completed this week",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}