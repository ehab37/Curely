import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';

class PrescriptionModel {
  final String? docId;
  final String doctorSpecialization;
  final String doctorName;
  final String? hospital;
  final String? diagnosis;
  final String examinationDate;
  final List<File>? images;
  List<String> imageUrls;

  PrescriptionModel({
    this.docId,
    required this.doctorSpecialization,
    required this.doctorName,
    this.hospital,
    this.diagnosis,
    required this.examinationDate,
    this.images,
    required this.imageUrls,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      docId: json['docId'],
      doctorSpecialization: json['doctorSpecialization'],
      doctorName: json['doctorName'],
      hospital: json['hospital'],
      diagnosis: json['diagnosis'],
      examinationDate: json['examinationDate'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }

  PrescriptionEntity toEntity() {
    return PrescriptionEntity(
      docId: docId!,
      doctorSpecialization: doctorSpecialization,
      doctorName: doctorName,
      hospital: hospital,
      diagnosis: diagnosis,
      examinationDate: examinationDate,
      images: images,
      imageUrls: imageUrls,
    );
  }

  factory PrescriptionModel.fromEntity(PrescriptionEntity entity) {
    return PrescriptionModel(
      doctorSpecialization: entity.doctorSpecialization,
      doctorName: entity.doctorName,
      hospital: entity.hospital,
      diagnosis: entity.diagnosis,
      examinationDate: entity.examinationDate,
      images: entity.images,
      imageUrls: entity.imageUrls!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorSpecialization': doctorSpecialization,
      'doctorName': doctorName,
      'hospital': hospital,
      'diagnosis': diagnosis,
      'examinationDate': examinationDate,
      'imageUrls': imageUrls,
    };
  }
}
