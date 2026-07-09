class JourneyXPEngine {
  JourneyXPEngine._();

  static int calculate({
    required bool hasProfile,
    required int educationCount,
    required int experienceCount,
    required int skillsCount,
  }) {
    int xp = 0;

    if (hasProfile) {
      xp += 20;
    }

    xp += educationCount * 25;
    xp += experienceCount * 30;
    xp += skillsCount * 10;

    return xp;
  }
}