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

class AnalysisEntity {
  final String? docId;
  final String analysisType;
  final String doctorName;
  final String? lab;
  final String? diagnosis;
  final String examinationDate;
  final List<File>? images;
  List<String>? imageUrls;

  AnalysisEntity({
    this.docId,
    required this.analysisType,
    required this.doctorName,
    this.lab,
    this.diagnosis,
    required this.examinationDate,
    this.images,
    this.imageUrls,
  });
}
