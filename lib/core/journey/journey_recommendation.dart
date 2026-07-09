import 'journey_module.dart';

class JourneyRecommendation {
  final JourneyModule module;
  final String title;
  final String message;
  final String actionText;
  final double priority;

  const JourneyRecommendation({
    required this.module,
    required this.title,
    required this.message,
    required this.actionText,
    required this.priority,
  });
}