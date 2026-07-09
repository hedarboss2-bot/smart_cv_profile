import 'package:flutter/material.dart';

class JourneyCoach extends StatelessWidget {
  final String message;

  const JourneyCoach({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return _JourneyGlassBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _JourneyGlassBox extends StatelessWidget {
  final Widget child;

  const _JourneyGlassBox({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
        ),
      ),
      child: child,
    );
  }
}