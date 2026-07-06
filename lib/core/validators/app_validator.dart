class AppValidator {
  AppValidator._();

  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w+$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }

    if (value.trim().length < 7) {
      return "Phone number is too short";
    }

    return null;
  }

  static String? percentage(int value) {
    if (value < 0 || value > 100) {
      return "Value must be between 0 and 100";
    }

    return null;
  }
}