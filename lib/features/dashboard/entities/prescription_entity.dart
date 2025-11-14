import 'dart:io';

enum Specialization {
  dentistry,
  neurology,
  earNoseThroat,
  orthopedics,
  cardiology,
  dermatology,
  gastroenterology,
  surgery,
  internalMedicine,
  obstetricsGynecology,
  ophthalmology,
  pediatrics,
  psychiatry,
  urology,
  other,
}
List<Prescription> prescriptionItems = [];

class Prescription {
  final Specialization specialization;
  final String doctorName;
  final String hospital;
  final String diagnosis;
  final DateTime examinationDate;
  final File image;

  Prescription({
    required this.specialization,
    required this.doctorName,
    required this.hospital,
    required this.diagnosis,
    required this.examinationDate,
    required this.image,
  });
}
