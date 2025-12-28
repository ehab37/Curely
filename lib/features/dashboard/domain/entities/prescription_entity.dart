import 'dart:io';

const List<String> doctorSpecializationsList = [
  'Dentistry',
  'Neurology',
  'Ear Nose Throat',
  'Orthopedics',
  'Cardiology',
  'Dermatology',
  'Gastroenterology',
  'Surgery',
  'Internal Medicine',
  'Obstetrics Gynecology',
  'Ophthalmology',
  'Pediatrics',
  'Psychiatry',
  'Urology',
  'Other',
];

List<PrescriptionEntity> prescriptionItems = [];

class PrescriptionEntity {
  final String? docId;
  final String doctorSpecialization;
  final String doctorName;
  final String? hospital;
  final String? diagnosis;
  final DateTime examinationDate;
  final File image;
  String? imageUrl;

  PrescriptionEntity({
    this.docId,
    required this.doctorSpecialization,
    required this.doctorName,
    this.hospital,
    this.diagnosis,
    required this.examinationDate,
    required this.image,
    this.imageUrl,
  });
}
