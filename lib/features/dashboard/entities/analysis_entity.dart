import 'dart:io';

enum AnalysisTypes {
  cBC,
  stoolAnalysis,
  urineTest,
  randomBloodGlucose,
  fastingBloodSugar,
  eSR,
  bleedingTime,
  glucose,
  cholesterol,
  uricAcid,
  creatinine,
  triglycerides,
  other,
}

List<Analysis> analysisItems = [];

class Analysis {
  final AnalysisTypes analysisTypes;
  final String doctorName;
  final String lab;
  final String diagnosis;
  final DateTime examinationDate;
  final File image;

  Analysis({
    required this.analysisTypes,
    required this.doctorName,
    required this.lab,
    required this.diagnosis,
    required this.examinationDate,
    required this.image,
  });
}
