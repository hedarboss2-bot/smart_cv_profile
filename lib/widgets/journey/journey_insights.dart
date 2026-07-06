import 'package:flutter/material.dart';

class JourneyInsights extends StatelessWidget {
  final List<String> insights;

  const JourneyInsights({
    super.key,
    required this.insights,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Insights",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        ...insights.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white70,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}