import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient primary = LinearGradient(
    colors: [
      Color(0xff111827),
      Color(0xff312E81),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premium = LinearGradient(
    colors: [
      Color(0xff111827),
      Color(0xff1E3A8A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient light = LinearGradient(
    colors: [
      Color(0xffEEF2FF),
      Color(0xffF5F3FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}