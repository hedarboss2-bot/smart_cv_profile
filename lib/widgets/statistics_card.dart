import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final int profile;
  final int education;
  final int gaming;
  final int devices;

  const StatisticsCard({
    super.key,
    required this.profile,
    required this.education,
    required this.gaming,
    required this.devices,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Statistics",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  title: "Profile",
                  value: "$profile%",
                  icon: Icons.person,
                  color: Colors.blue,
                ),
                _StatItem(
                  title: "Education",
                  value: "$education",
                  icon: Icons.school,
                  color: Colors.green,
                ),
                _StatItem(
                  title: "Gaming",
                  value: "$gaming",
                  icon: Icons.sports_esports,
                  color: Colors.orange,
                ),
                _StatItem(
                  title: "Devices",
                  value: "$devices",
                  icon: Icons.computer,
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}