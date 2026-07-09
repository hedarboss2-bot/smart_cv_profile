import 'package:flutter/material.dart';

class DashboardProgressOverview extends StatelessWidget {
  final double educationProgress;
  final double experienceProgress;
  final double skillsProgress;

  const DashboardProgressOverview({
    super.key,
    required this.educationProgress,
    required this.experienceProgress,
    required this.skillsProgress,
  });

  double get overallProgress {
    return (educationProgress + experienceProgress + skillsProgress) / 3;
  }

  @override
  Widget build(BuildContext context) {
    final percent = (overallProgress * 100).toInt();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [
            Color(0xff111827),
            Color(0xff312E81),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Overall Progress",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: overallProgress,
              minHeight: 12,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "$percent% completed",
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          _ProgressItem(
            title: "Education",
            progress: educationProgress,
          ),
          const SizedBox(height: 12),

          _ProgressItem(
            title: "Experience",
            progress: experienceProgress,
          ),
          const SizedBox(height: 12),

          _ProgressItem(
            title: "Skills",
            progress: skillsProgress,
          ),
        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String title;
  final double progress;

  const _ProgressItem({
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 7,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "$percent%",
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}