class AchievementModel {
  final String title;
  final String description;
  final bool unlocked;

  const AchievementModel({
    required this.title,
    required this.description,
    required this.unlocked,
  });

  AchievementModel copyWith({
    String? title,
    String? description,
    bool? unlocked,
  }) {
    return AchievementModel(
      title: title ?? this.title,
      description: description ?? this.description,
      unlocked: unlocked ?? this.unlocked,
    );
  }
}