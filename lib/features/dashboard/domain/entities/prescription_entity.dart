import 'dart:io';

const List<String> doctorSpecializationsList = [
  'dentistry',
  'neurology',
  'ear_nose_throat',
  'orthopedics',
  'cardiology',
  'dermatology',
  'gastroenterology',
  'surgery',
  'internal_medicine',
  'obstetrics_gynecology',
  'ophthalmology',
  'pediatrics',
  'psychiatry',
  'urology',
  'other',
];

class PrescriptionEntity {
  final String? docId;
  final String doctorSpecialization;
  final String doctorName;
  final String? hospital;
  String? diagnosis;
  final String examinationDate;
  bool isFavorite;
  final List<File>? images;
  List<String>? imageUrls;

  PrescriptionEntity({
    this.docId,
    required this.doctorSpecialization,
    required this.doctorName,
    this.hospital,
    this.diagnosis,
    required this.examinationDate,
    this.isFavorite = false,
    this.images,
    this.imageUrls,
  });
}
