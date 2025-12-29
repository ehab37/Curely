import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';

class RaysModel {
  final String? docId;
  final String raysType;
  final String doctorName;
  final String? radiologyCenter;
  final String? diagnosis;
  final String examinationDate;
  final File? image;
  String imageUrl;

  RaysModel({
    this.docId,
    required this.raysType,
    required this.doctorName,
    this.radiologyCenter,
    this.diagnosis,
    required this.examinationDate,
    this.image,
    required this.imageUrl,
  });

  factory RaysModel.fromJson(Map<String, dynamic> json) {
    return RaysModel(
      docId: json['docId'],
      raysType: json['raysType'],
      doctorName: json['doctorName'],
      radiologyCenter: json['radiologyCenter'],
      diagnosis: json['diagnosis'],
      examinationDate: json['examinationDate'],
      imageUrl:json['imageUrl'],
    );
  }

  RaysEntity toEntity() {
    return RaysEntity(
      docId: docId!,
      raysType: raysType,
      doctorName: doctorName,
      radiologyCenter: radiologyCenter,
      diagnosis: diagnosis,
      examinationDate: examinationDate,
      image: image,
      imageUrl: imageUrl,
    );
  }

  factory RaysModel.fromEntity(RaysEntity entity) {
    return RaysModel(
      raysType: entity.raysType,
      doctorName: entity.doctorName,
      radiologyCenter: entity.radiologyCenter,
      diagnosis: entity.diagnosis,
      examinationDate: entity.examinationDate,
      image: entity.image,
      imageUrl: entity.imageUrl!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'raysType': raysType,
      'doctorName': doctorName,
      'radiologyCenter': radiologyCenter,
      'diagnosis': diagnosis,
      'examinationDate': examinationDate,
      'imageUrl': imageUrl,
    };
  }
}
