import 'package:easy_localization/easy_localization.dart';
import 'app_regex.dart';

extension StringValidation on String? {
  String? get validateEmail {
    if (this == null || this!.trim().isEmpty) {
      return 'email_required'.tr();
    }
    if (!AppRegex.isEmailValid(this!.trim())) {
      return 'enter_valid_email'.tr();
    }
    return null;
  }

  String? get validateLoginPassword {
    if (this == null ||
        this!.isEmpty ||
        this!.trim().isEmpty ||
        this!.length < 8) {
      return 'password_required'.tr();
    }
    return null;
  }

  String? get validatePassword {
    if (this == null || this!.isEmpty) {
      return 'password_required'.tr();
    }

    if (!AppRegex.isPasswordValid(this!)) {
      return 'password_validation_rules'.tr();
    }
    return null;
  }

  String? validateMatch(String? originalValue) {
    if (this == null || this!.isEmpty) {
      return 'confirm_password_required'.tr();
    }
    if (this != originalValue) {
      return 'passwords_do_not_match'.tr();
    }
    return null;
  }

  String? get validateName {
    if (this == null || this!.trim().isEmpty) {
      return 'name_required'.tr();
    }
    if (this!.length < 2) {
      return 'name_min_length'.tr();
    }
    if (!AppRegex.isNameValid(this!)) {
      return 'name_invalid'.tr();
    }
    return null;
  }

  String? get validateNameArabic {
    if (this == null || this!.trim().isEmpty) {
      return 'name_required'.tr();
    }
    if (this!.length < 2) {
      return 'name_min_length'.tr();
    }
    if (!AppRegex.isNameValidArabic(this!)) {
      return 'name_invalid'.tr();
    }
    return null;
  }

  String? validateNumberLength() {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    if (!AppRegex.isNumberValid(this!)) {
      return 'invalid_number_length'.tr();
    }
    return null;
  }

  String? get validateBloodType {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    if (!AppRegex.isBloodTypeValid(this!)) {
      return 'invalid_blood_type'.tr();
    }
    return null;
  }

  String? get validateRequired {
    if (this == null || this!.trim().isEmpty) {
      return 'field_required'.tr();
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

  static String? validateNameArabic(String? value) => value.validateNameArabic;

  static String? validatePassword(String? value) => value.validatePassword;

  static String? validateLoginPassword(String? value) =>
      value.validateLoginPassword;

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) => value.validateMatch(originalPassword);

  static String? validateNumberLength(String? value) =>
      value.validateNumberLength();

  static String? validateBloodType(String? value) => value.validateBloodType;

  static String? validateRequired(String? value) => value.validateRequired;

  /// ================= PHONE (UPDATED) =================
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phone_number_required'.tr();
    }

    if (!AppRegex.isPhoneValid(value)) {
      return 'enter_valid_phone_number'.tr();
    }

    return null;
  }
}
