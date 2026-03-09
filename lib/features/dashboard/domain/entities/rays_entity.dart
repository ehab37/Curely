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

class RaysEntity {
  final String? docId;
  final String raysType;
  final String doctorName;
  final String? radiologyCenter;
  String? diagnosis;
  final String examinationDate;
  bool isFavorite;
  final List<File>? images;
  List<String>? imageUrls;

  RaysEntity({
    this.docId,
    required this.raysType,
    required this.doctorName,
    this.radiologyCenter,
    this.diagnosis,
    required this.examinationDate,
    this.isFavorite = false,
    this.images,
    this.imageUrls,
  });
}
