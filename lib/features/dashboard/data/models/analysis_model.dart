import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';

class AnalysisModel {
  final String? docId;
  final String analysisType;
  final String doctorName;
  final String? lab;
  final String? diagnosis;
  final String examinationDate;
  final List<File>? images;
  List<String> imageUrls;

  AnalysisModel({
    this.docId,
    required this.analysisType,
    required this.doctorName,
    this.lab,
    this.diagnosis,
    required this.examinationDate,
    this.images,
    required this.imageUrls,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      docId: json['docId'],
      analysisType: json['analysisType'],
      doctorName: json['doctorName'],
      lab: json['lab'],
      diagnosis: json['diagnosis'],
      examinationDate: json['examinationDate'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }

  AnalysisEntity toEntity() {
    return AnalysisEntity(
      docId: docId!,
      analysisType: analysisType,
      doctorName: doctorName,
      lab: lab,
      diagnosis: diagnosis,
      examinationDate: examinationDate,
      images: images,
      imageUrls: imageUrls,
    );
  }

  factory AnalysisModel.fromEntity(AnalysisEntity entity) {
    return AnalysisModel(
      analysisType: entity.analysisType,
      doctorName: entity.doctorName,
      lab: entity.lab,
      diagnosis: entity.diagnosis,
      examinationDate: entity.examinationDate,
      images: entity.images,
      imageUrls: entity.imageUrls!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'analysisType': analysisType,
      'doctorName': doctorName,
      'lab': lab,
      'diagnosis': diagnosis,
      'examinationDate': examinationDate,
      'imageUrls': imageUrls,
    };
  }
}
