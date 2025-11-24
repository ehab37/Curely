import 'dart:io';

const List<String> raysTypesList = [
  'Cardiogram',
  'X-Rays',
  'Deep Xray',
  'Electrocardiogram',
  'CT Scan',
  'MRI',
  'Fluoroscopy',
  'Mammography',
  'DEXA',
  'Isotope',
  'Other',
];
List<RaysEntity> raysItems = [];

class RaysEntity {
  final String raysType;
  final String doctorName;
  final String? radiologyCenter;
  final String? diagnosis;
  final DateTime examinationDate;
  final File image;
  final String? imageUrl;

  RaysEntity({
    required this.raysType,
    required this.doctorName,
    this.radiologyCenter,
    this.diagnosis,
    required this.examinationDate,
    required this.image,
    this.imageUrl,
  });
}
