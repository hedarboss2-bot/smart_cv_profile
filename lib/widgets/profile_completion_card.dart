import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/identity_level.dart';

class ProfileCompletionCard extends StatelessWidget {
  final double progress;
  final IdentityLevel level;
  final String message;

  const ProfileCompletionCard({
    super.key,
    required this.progress,
    required this.level,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Identity Score",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Text(
                  level.emoji,
                  style: const TextStyle(fontSize: 38),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${level.title} Member",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("$percent% Completed"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 18),

            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(20),
            ),

            const SizedBox(height: 14),

            Text(message),

            const SizedBox(height: 18),

            FilledButton(
              onPressed: () {},
              child: const Text("Continue Profile"),
            ),
          ],
        ),
      ),
    );
  }
}