import 'package:flutter/material.dart';

import 'package:smart_cv_profile/core/design/app_colors.dart';
import 'package:smart_cv_profile/core/design/app_spacing.dart';

class AppPage extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool safeArea;

  const AppPage({
    super.key,
    required this.child,
    this.padding = AppSpacing.screen,
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      color: AppColors.background,
      width: double.infinity,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (!safeArea) {
      return content;
    }

    return SafeArea(
      child: content,
    );
  }
}