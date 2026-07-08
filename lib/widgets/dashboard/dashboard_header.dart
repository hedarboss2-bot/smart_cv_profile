import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String name;

  const DashboardHeader({
    super.key,
    required this.name,
  });

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) return "Good Morning";
    if (hour < 18) return "Good Afternoon";
    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _greeting(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 6),
              Text(
                name.isEmpty ? "Welcome!" : "Hi, $name 👋",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                "Keep building your professional identity.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 28,
          child: const Icon(Icons.person),
        ),
      ],
    );
  }
}