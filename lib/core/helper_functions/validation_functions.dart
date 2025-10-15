String? emailValidator(String? value) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regex = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Email is required.';
  }

  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address.';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required.';
  }
  const minLength = 8;
  const regexPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  final regex = RegExp(regexPattern);

  if (value.length < minLength || !regex.hasMatch(value)) {
    return 'Password must be at least 8 characters and include: \n'
        '• Uppercase letter \n'
        '• Lowercase letter \n'
        '• Number \n'
        '• Special character (@\$!%*?&)';
  }
  return null;
}
String? confirmPasswordValidator(String? value, String originalPassword) {
  if (value == null || value.isEmpty) {
    return 'Confirm Password is required.';
  }

  if (value != originalPassword) {
    return 'Passwords do not match.';
  }

  return null;
}

String? nameValidator(String? value) {
  const pattern = r"^[a-zA-Z\s]{2,}$";
  final regex = RegExp(pattern);
  const minLength = 2;

  if (value == null || value.isEmpty) {
    return 'Name is required.';
  }

  if (value.length < minLength) {
    return 'Name must be at least $minLength characters long.';
  }

  if (!regex.hasMatch(value)) {
    return 'Name can only contain letters or spaces.';
  }

  return null;
}
