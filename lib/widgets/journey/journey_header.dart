import 'package:flutter/material.dart';

class JourneyHeader extends StatelessWidget {
  final String title;
  final String level;
  final double progress;
  final IconData icon;

  const JourneyHeader({
    super.key,
    required this.title,
    required this.level,
    required this.progress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white.withOpacity(0.15),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title Journey",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                level,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        Text(
          "$percent%",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}