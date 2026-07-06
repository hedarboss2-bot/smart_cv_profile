class JourneyLevelEngine {
  JourneyLevelEngine._();

  static String getLevel(double progress) {
    final percent = (progress * 100).toInt();

    if (percent >= 81) return "Expert ⭐⭐⭐⭐⭐";
    if (percent >= 61) return "Advanced ⭐⭐⭐⭐☆";
    if (percent >= 41) return "Intermediate ⭐⭐⭐☆☆";
    if (percent >= 21) return "Elementary ⭐⭐☆☆☆";

    return "Beginner ⭐☆☆☆☆";
  }
}