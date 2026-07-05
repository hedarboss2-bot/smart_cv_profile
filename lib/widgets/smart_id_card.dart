import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_cv_profile/models/user_model.dart';

class SmartIdCard extends StatelessWidget {
  final UserModel user;

  const SmartIdCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          colors: [
            Color(0xff111827),
            Color(0xff1E3A8A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white24,
                backgroundImage: user.imagePath.isNotEmpty
                    ? FileImage(File(user.imagePath))
                    : null,
                child: user.imagePath.isEmpty
                    ? const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 38,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName.isEmpty ? "Smart CV User" : user.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      user.jobTitle.isEmpty
                          ? "Digital Identity"
                          : user.jobTitle,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _InfoRow(
            icon: Icons.email,
            text: user.email.isEmpty ? "email@example.com" : user.email,
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.phone,
            text: user.phone.isEmpty ? "+000 000 0000" : user.phone,
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.location_on,
            text: user.city.isEmpty && user.country.isEmpty
                ? "Your Location"
                : "${user.city}, ${user.country}",
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.language,
            text: user.website.isEmpty ? "yourwebsite.com" : user.website,
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.qr_code_2, color: Colors.white, size: 42),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    "Smart ID Card\nQR Profile coming soon",
                    style: TextStyle(color: Colors.white),
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}