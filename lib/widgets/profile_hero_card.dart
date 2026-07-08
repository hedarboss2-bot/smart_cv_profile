import 'dart:io';

import 'package:flutter/material.dart';

import 'package:smart_cv_profile/models/user_model.dart';

class ProfileHeroCard extends StatelessWidget {
  final UserModel user;
  final double progress;
  final VoidCallback onEdit;

  const ProfileHeroCard({
    super.key,
    required this.user,
    required this.progress,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [
            Color(0xffEEF2FF),
            Color(0xffF5F3FF),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    backgroundImage: user.imagePath.isNotEmpty
                        ? FileImage(File(user.imagePath))
                        : null,
                    child: user.imagePath.isEmpty
                        ? const Icon(
                            Icons.person,
                            size: 48,
                            color: Color(0xff4F46E5),
                          )
                        : null,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: onEdit,
                      child: const CircleAvatar(
                        radius: 17,
                        backgroundColor: Color(0xff4F46E5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName.isEmpty ? "Smart CV User" : user.fullName,
                      style: const TextStyle(
                        color: Color(0xff111827),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      user.jobTitle.isEmpty
                          ? "Build your professional future"
                          : user.jobTitle,
                      style: const TextStyle(
                        color: Color(0xff4B5563),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        "✦ Smart CV Member",
                        style: TextStyle(
                          color: Color(0xff4F46E5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Profile Completion",
                        style: TextStyle(
                          color: Color(0xff111827),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "$percent%",
                      style: const TextStyle(
                        color: Color(0xff4F46E5),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Color(0xffE5E7EB),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xff4F46E5),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Great progress! Keep going to reach Expert level.",
                  style: TextStyle(
                    color: Color(0xff6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}