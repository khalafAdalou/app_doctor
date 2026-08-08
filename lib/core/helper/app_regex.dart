class AppRegex {
  /// Email
  static bool isEmailValid(String email) {
    return RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    ).hasMatch(email.trim());
  }

  /// Password:
  /// - 8 characters minimum
  /// - at least one lowercase
  /// - at least one uppercase
  /// - at least one number
  /// - at least one special character
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#?!@$%^&*-]).{8,}$',
    ).hasMatch(password);
  }

  /// Qatar phone number
  /// Accepted:
  /// 0097455123456
  /// 97455123456
  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(
      r'^(00974|974)[0-9]{8}$',
    ).hasMatch(phoneNumber.trim());
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'[0-9]').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(
      r'[#?!@$%^&*-]',
    ).hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return password.length >= 8;
  }
}