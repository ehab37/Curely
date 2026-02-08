abstract class AppRegex {
  static bool isEmailValid(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(pattern).hasMatch(email);
  }

  static bool isNameValid(String name) {
    const pattern = r"^[a-zA-Z\s]{2,}$";
    return RegExp(pattern).hasMatch(name);
  }

  static bool isPasswordValid(String password) {
    const minLength = 8;
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    return password.length >= minLength && RegExp(pattern).hasMatch(password);
  }

  static bool isNumberValid(String number) {
    const pattern = r'^\d{2,3}$';
    return RegExp(pattern).hasMatch(number.trim());
  }

  static bool isBloodTypeValid(String bloodType) {
    const pattern = r'^(A|B|AB|O)[+-]$';
    return RegExp(pattern, caseSensitive: false).hasMatch(bloodType.trim());
  }

  static bool isPhoneValid(String phone) {
    final trimmed = phone.trim();

    final localRegex = RegExp(r'^01[0-9]{9}$');

    final internationalRegex = RegExp(r'^\+201[0-9]{9}$');

    return localRegex.hasMatch(trimmed) || internationalRegex.hasMatch(trimmed);
  }
}
