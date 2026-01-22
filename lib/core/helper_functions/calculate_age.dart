import 'dart:developer';

int? calculateAge(String? dateOfBirth) {
  if (dateOfBirth == null || dateOfBirth.isEmpty) {
    return null;
  }
  try {
    final birthDate = DateTime.parse(dateOfBirth);
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  } catch (e) {
    log('Error parsing date for age calculation: $e');
    return null;
  }
}
