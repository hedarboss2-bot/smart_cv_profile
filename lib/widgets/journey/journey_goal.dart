import 'package:flutter/material.dart';

class JourneyGoal extends StatelessWidget {
  final String goal;
  final String reward;

  const JourneyGoal({
    super.key,
    required this.goal,
    this.reward = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: .10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.flag,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Next Goal",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  goal,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
                if (reward.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    reward,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}