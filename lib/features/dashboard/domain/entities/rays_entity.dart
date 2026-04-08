import 'dart:io';

const List<String> raysTypesList = [
  'cardiogram',
  'x_rays',
  'deep_xray',
  'electrocardiogram',
  'ct_scan',
  'mri',
  'fluoroscopy',
  'mammography',
  'dexa',
  'isotope',
  'other',
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
