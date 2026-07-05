import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.check),
      label: Text(title),
    );
  }
}