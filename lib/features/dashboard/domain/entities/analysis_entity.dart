import 'dart:io';

const List<String> analysisTypesList = [
  'cbc',
  'stool_analysis',
  'urine_test',
  'random_blood_glucose',
  'fasting_blood_sugar',
  'esr',
  'bleeding_time',
  'glucose',
  'cholesterol',
  'uric_acid',
  'creatinine',
  'triglycerides',
  'other',
];

class AnalysisEntity {
  final String? docId;
  final String analysisType;
  final String doctorName;
  final String? lab;
  String? diagnosis;
  final String examinationDate;
  bool isFavorite;
  final List<File>? images;
  List<String>? imageUrls;

  AnalysisEntity({
    this.docId,
    required this.analysisType,
    required this.doctorName,
    this.lab,
    this.diagnosis,
    required this.examinationDate,
    this.isFavorite = false,
    this.images,
    this.imageUrls,
  });
}
