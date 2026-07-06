import 'package:flutter/material.dart';

class JourneyProgress extends StatelessWidget {
  final double progress;

  const JourneyProgress({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "$percent% Completed",
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}