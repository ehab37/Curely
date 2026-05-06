import 'dart:io';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';

class RaysModel {
  final String? docId;
  final String raysType;
  final String doctorName;
  final String? radiologyCenter;
  final String? diagnosis;
  final String examinationDate;
  final bool isFavorite;
  final List<File>? images;
  List<String> imageUrls;

  RaysModel({
    this.docId,
    required this.raysType,
    required this.doctorName,
    this.radiologyCenter,
    this.diagnosis,
    required this.examinationDate,
    required this.isFavorite,
    this.images,
    required this.imageUrls,
  });

  factory RaysModel.fromJson(Map<String, dynamic> json) {
    return RaysModel(
      docId: json['docId'],
      raysType: json['raysType'],
      doctorName: json['doctorName'],
      radiologyCenter: json['radiologyCenter'],
      diagnosis: json['diagnosis'],
      examinationDate: json['examinationDate'],
      isFavorite: json['isFavorite'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }

  RaysEntity toEntity() {
    return RaysEntity(
      docId: docId!,
      raysType: raysType,
      doctorName: doctorName,
      radiologyCenter: radiologyCenter,
      diagnosis: diagnosis,
      examinationDate: examinationDate.toReadableDate(),
      isFavorite: isFavorite,
      images: images,
      imageUrls: imageUrls,
    );
  }

  factory RaysModel.fromEntity(RaysEntity entity) {
    return RaysModel(
      raysType: entity.raysType,
      doctorName: entity.doctorName,
      radiologyCenter: entity.radiologyCenter,
      diagnosis: entity.diagnosis,
      examinationDate: entity.examinationDate,
      isFavorite: entity.isFavorite,
      images: entity.images,
      imageUrls: entity.imageUrls!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'raysType': raysType,
      'doctorName': doctorName,
      'radiologyCenter': radiologyCenter,
      'diagnosis': diagnosis,
      'examinationDate': examinationDate,
      'isFavorite': isFavorite,
      'imageUrls': imageUrls,
    };
  }
}
