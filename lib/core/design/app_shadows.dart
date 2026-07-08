import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color.fromARGB(20, 0, 0, 0),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color.fromARGB(30, 0, 0, 0),
      blurRadius: 28,
      offset: Offset(0, 12),
    ),
  ];
}