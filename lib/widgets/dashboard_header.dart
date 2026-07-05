import 'dart:io';

import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String greeting;
  final String userName;
  final String imagePath;

  const DashboardHeader({
    super.key,
    required this.greeting,
    required this.userName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff4F46E5),
            Color(0xff2563EB),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white24,
            backgroundImage:
                imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
            child: imagePath.isEmpty
                ? const Icon(Icons.person, size: 36, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 6),
                Text(
                  userName.isEmpty ? "Smart CV User" : userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
    );
  }
}