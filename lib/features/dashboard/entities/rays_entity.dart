import 'dart:io';

enum RaysTypes {
  cardiogram,
  xRays,
  deepXray,
  electrocardiogram,
  cTScan,
  mRI,
  fluoroscopy,
  mammography,
  dEXA,
  isotope,
  other,
}
List<Rays> raysItems = [];

class Rays {
  final RaysTypes raysTypes;
  final String doctorName;
  final String radiologyCenter;
  final String diagnosis;
  final DateTime examinationDate;
  final File image;

  Rays({
    required this.raysTypes,
    required this.doctorName,
    required this.radiologyCenter,
    required this.diagnosis,
    required this.examinationDate,
    required this.image,
  });
}
