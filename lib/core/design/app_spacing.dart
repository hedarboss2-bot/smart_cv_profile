import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 20.0;
  static const xl = 28.0;
  static const xxl = 40.0;

  static const page = EdgeInsets.all(lg);

  static const card = EdgeInsets.all(lg);

  static const screen = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: lg,
  );
}