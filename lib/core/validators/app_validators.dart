import 'package:curely/generated/l10n.dart';
import 'app_regex.dart';

extension StringValidation on String? {
  String? get validateEmail {
    if (this == null || this!.trim().isEmpty) {
      return S.current.emailIsRequired;
    }
    if (!AppRegex.isEmailValid(this!.trim())) {
      return S.current.invalidEmail;
    }
    return null;
  }

  String? get validateLoginPassword {
    if (this == null ||
        this!.isEmpty ||
        this!.trim().isEmpty ||
        this!.length < 8) {
      return S.current.passwordIsRequired;
    }
    return null;
  }

  String? get validatePassword {
    if (this == null || this!.isEmpty) {
      return S.current.passwordIsRequired;
    }

    if (!AppRegex.isPasswordValid(this!)) {
      return '${S.current.passwordTooShort}'
          '\n'
          '• ${S.current.passwordUppercaseLetter} '
          '\n'
          '• ${S.current.passwordLowercaseLetter} '
          '\n'
          '• ${S.current.passwordNumber}'
          ' \n'
          '• ${S.current.passwordSpecialCharacter}'
          ' (@\$!%*?&)';
    }
    return null;
  }

  String? validateMatch(String? originalValue) {
    if (this == null || this!.isEmpty) {
      return S.current.confirmPasswordIsRequired;
    }
    if (this != originalValue) {
      return S.current.passwordsDoNotMatch;
    }
    return null;
  }

  String? get validateName {
    if (this == null || this!.trim().isEmpty) {
      return S.current.nameIsRequired;
    }
    if (this!.length < 2) {
      return S.current.nameTooShort;
    }
    if (!AppRegex.isNameValid(this!)) {
      return S.current.nameCanOnlyContainLettersOrSpaces;
    }
    return null;
  }

  String? validateNumberLength(String? fieldName) {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    if (!AppRegex.isNumberValid(this!)) {
      return 'Please enter a valid $fieldName (2-3 digits).';
    }
    return null;
  }

  String? get validateBloodType {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    if (!AppRegex.isBloodTypeValid(this!)) {
      return 'Invalid blood type (e.g., A+, O-).';
    }
    return null;
  }

  String? get validateRequired {
    if (this == null || this!.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateMinLength(int minLength, {String? errorMessage}) {
    if (this == null || this!.length < minLength) {
      return errorMessage ?? 'Must be at least $minLength characters';
    }
    return null;
  }

  String? validateMaxLength(int maxLength, {String? errorMessage}) {
    if (this != null && this!.length > maxLength) {
      return errorMessage ?? 'Must be at most $maxLength characters';
    }
    return null;
  }
}

class AppValidators {
  static String? validateEmail(String? value) => value.validateEmail;

  static String? validateName(String? value) => value.validateName;

  static String? validatePassword(String? value) => value.validatePassword;

  static String? validateLoginPassword(String? value) =>
      value.validateLoginPassword;

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) => value.validateMatch(originalPassword);

  static String? validateNumberLength(String? value, String? fieldName) =>
      value.validateNumberLength(fieldName);

  static String? validateBloodType(String? value) => value.validateBloodType;

  static String? validateRequired(String? value) => value.validateRequired;

  /// ================= PHONE (UPDATED) =================
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    if (!AppRegex.isPhoneValid(value)) {
      return 'Enter a valid phone number';
    }

    return null;
  }
}
