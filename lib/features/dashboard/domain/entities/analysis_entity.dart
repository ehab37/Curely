import 'dart:io';

const List<String> analysisTypesList = [
  'CBC',
  'Stool Analysis',
  'Urine Test',
  'Random Blood Glucose',
  'Fasting Blood Sugar',
  'ESR',
  'Bleeding Time',
  'Glucose',
  'Cholesterol',
  'Uric Acid',
  'Creatinine',
  'Triglycerides',
  'Other',
];

List<AnalysisEntity> analysisItems = [];

class AnalysisEntity {
  final String analysisType;
  final String doctorName;
  final String? lab;
  final String? diagnosis;
  final DateTime examinationDate;
  final File image;
  final String? imageUrl;

  AnalysisEntity({
    required this.analysisType,
    required this.doctorName,
    this.lab,
    this.diagnosis,
    required this.examinationDate,
    required this.image,
    this.imageUrl,
  });
}
