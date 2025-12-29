import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';

class AnalysisModel {
  final String? docId;
  final String analysisType;
  final String doctorName;
  final String? lab;
  final String? diagnosis;
  final String examinationDate;
  final File? image;
  String imageUrl;

  AnalysisModel({
    this.docId,
    required this.analysisType,
    required this.doctorName,
    this.lab,
    this.diagnosis,
    required this.examinationDate,
    this.image,
    required this.imageUrl,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      docId: json['docId'],
      analysisType: json['analysisType'],
      doctorName: json['doctorName'],
      lab: json['lab'],
      diagnosis: json['diagnosis'],
      examinationDate: json['examinationDate'],
      imageUrl:json['imageUrl'],
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
      image: image,
      imageUrl: imageUrl,
    );
  }

  factory AnalysisModel.fromEntity(AnalysisEntity entity) {
    return AnalysisModel(
      analysisType: entity.analysisType,
      doctorName: entity.doctorName,
      lab: entity.lab,
      diagnosis: entity.diagnosis,
      examinationDate: entity.examinationDate,
      image: entity.image,
      imageUrl: entity.imageUrl!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'analysisType': analysisType,
      'doctorName': doctorName,
      'lab': lab,
      'diagnosis': diagnosis,
      'examinationDate': examinationDate,
      'imageUrl': imageUrl,
    };
  }
}
