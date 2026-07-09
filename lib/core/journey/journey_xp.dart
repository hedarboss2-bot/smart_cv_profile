class JourneyXP {
  JourneyXP._();

  // Rewards
  static const int profile = 20;
  static const int education = 25;
  static const int experience = 30;
  static const int skill = 10;

  static const int completeModule = 50;

  /// Returns the current level based on total XP.
  static int level(int xp) {
    return (xp ~/ 100) + 1;
  }

  /// XP required to reach the next level.
  static int nextLevelXP(int xp) {
    final level = JourneyXP.level(xp);
    return level * 100;
  }

  /// Current XP within the current level.
  static int currentLevelXP(int xp) {
    return xp % 100;
  }

  /// Progress between 0.0 and 1.0 for the current level.
  static double progress(int xp) {
    return currentLevelXP(xp) / 100;
  }
}