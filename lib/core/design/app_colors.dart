import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF1D4ED8);

  // Background
  static const Color background = Color(0xFF0F172A);
  static const Color surface = Color(0xFF1E293B);

  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFCBD5E1);

  // Status
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Progress
  static const Color progressLow = error;
  static const Color progressMedium = warning;
  static const Color progressHigh = success;

  // Cards
  static const Color card = Color(0xFF1E293B);

  // Border
  static const Color border = Color(0xFF334155);
}