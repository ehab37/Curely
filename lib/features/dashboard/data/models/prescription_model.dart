import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';

class PrescriptionModel {
  final String? docId;
  final String doctorSpecialization;
  final String doctorName;
  final String? hospital;
  final String? diagnosis;
  final DateTime examinationDate;
  final File? image;
  String imageUrl;

  PrescriptionModel({
    this.docId,
    required this.doctorSpecialization,
    required this.doctorName,
    this.hospital,
    this.diagnosis,
    required this.examinationDate,
    this.image,
    required this.imageUrl,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      docId: json['docId'],
      doctorSpecialization: json['doctorSpecialization'],
      doctorName: json['doctorName'],
      hospital: json['hospital'],
      diagnosis: json['diagnosis'],
      examinationDate: json['examinationDate'],
      imageUrl:json['imageUrl'],
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
      image: image!,
      imageUrl: imageUrl,
    );
  }

  factory PrescriptionModel.fromEntity(PrescriptionEntity entity) {
    return PrescriptionModel(
      doctorSpecialization: entity.doctorSpecialization,
      doctorName: entity.doctorName,
      hospital: entity.hospital,
      diagnosis: entity.diagnosis,
      examinationDate: entity.examinationDate,
      image: entity.image,
      imageUrl: entity.imageUrl!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorSpecialization': doctorSpecialization,
      'doctorName': doctorName,
      'hospital': hospital,
      'diagnosis': diagnosis,
      'examinationDate': examinationDate,
      'imageUrl': imageUrl,
    };
  }
}
