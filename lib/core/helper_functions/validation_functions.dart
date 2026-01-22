import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';

String? emailValidator(String? value, BuildContext context) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regex = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return S.of(context).emailIsRequired;
  }

  if (!regex.hasMatch(value)) {
    return S.of(context).invalidEmail;
  }

  return null;
}

String? passwordValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).passwordIsRequired;
  }
  const minLength = 8;
  const regexPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  final regex = RegExp(regexPattern);

  if (value.length < minLength || !regex.hasMatch(value)) {
    return '${S.of(context).passwordTooShort}'
        '\n'
        '• ${S.of(context).passwordUppercaseLetter} '
        '\n'
        '• ${S.of(context).passwordLowercaseLetter} '
        '\n'
        '• ${S.of(context).passwordNumber}'
        ' \n'
        '• ${S.of(context).passwordSpecialCharacter}'
        ' (@\$!%*?&)';
  }
  return null;
}

String? confirmPasswordValidator(
  String? value,
  String originalPassword,
  BuildContext context,
) {
  if (value == null || value.isEmpty) {
    return S.of(context).confirmPasswordIsRequired;
  }

  if (value != originalPassword) {
    return S.of(context).passwordsDoNotMatch;
  }

  return null;
}

String? nameValidator(String? value, BuildContext context) {
  const pattern = r"^[a-zA-Z\s]{2,}$";
  final regex = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return S.of(context).nameIsRequired;
  }

  if (value.length < 2) {
    return S.of(context).nameTooShort;
  }

  if (!regex.hasMatch(value)) {
    return S.of(context).nameCanOnlyContainLettersOrSpaces;
  }

  return null;
}

String? dropdownValidator(String? selectedValue) {
  if (selectedValue == null) {
    return 'Please select an item!';
  }
  return null;
}

String? numberLengthValidator(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  final validNumberRegex = RegExp(r'^\d{2,3}$');
  if (!validNumberRegex.hasMatch(value.trim())) {
    return 'Please enter a valid $fieldName (2-3 digits).';
  }
  return null;
}

String? bloodTypeValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  final validBloodTypeRegex = RegExp(r'^(A|B|AB|O)[+-]$', caseSensitive: false);
  if (!validBloodTypeRegex.hasMatch(value.trim())) {
    return 'Invalid blood type (e.g., A+, O-).';
  }
  return null;
}
