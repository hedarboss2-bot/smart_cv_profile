enum IdentityLevel {
  bronze,
  silver,
  gold,
  diamond,
}

extension IdentityLevelExtension on IdentityLevel {
  String get title {
    switch (this) {
      case IdentityLevel.bronze:
        return "Bronze";
      case IdentityLevel.silver:
        return "Silver";
      case IdentityLevel.gold:
        return "Gold";
      case IdentityLevel.diamond:
        return "Diamond";
    }
  }

  String get emoji {
    switch (this) {
      case IdentityLevel.bronze:
        return "🥉";
      case IdentityLevel.silver:
        return "🥈";
      case IdentityLevel.gold:
        return "🥇";
      case IdentityLevel.diamond:
        return "💎";
    }
  }
}