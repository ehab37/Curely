import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';

class MedicineModel {
  final String? docId;
  final String medicineUsage;
  final String medicineName;
  final String frequency;
  final String? medicineNotes;
  final String medicineTypes;
  final bool isReminderActive;
  final bool isFavorite;
  final File? image;
  String? imageUrl;

  MedicineModel({
    this.docId,
    required this.medicineUsage,
    required this.medicineName,
    required this.frequency,
    this.medicineNotes,
    required this.isReminderActive,
    required this.medicineTypes,
    required this.isFavorite,
    this.image,
    this.imageUrl,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      docId: json['docId'],
      medicineUsage: json['medicineUsage'],
      medicineName: json['medicineName'],
      frequency: json['frequency'],
      medicineNotes: json['medicineNotes'],
      medicineTypes: json['medicineTypes'],
      isReminderActive: json['isReminderActive'],
      isFavorite: json['isFavorite'],
      imageUrl: json['imageUrl'],
    );
  }

  MedicineEntity toEntity() {
    return MedicineEntity(
      docId: docId!,
      medicineUsage: medicineUsage,
      medicineName: medicineName,
      frequency: frequency,
      medicineNotes: medicineNotes,
      medicineTypes: medicineTypes,
      isReminderActive: isReminderActive,
      isFavorite: isFavorite,
      image: image,
      imageUrl: imageUrl,
    );
  }

  factory MedicineModel.fromEntity(MedicineEntity entity) {
    return MedicineModel(
      medicineUsage: entity.medicineUsage,
      medicineName: entity.medicineName,
      frequency: entity.frequency,
      medicineNotes: entity.medicineNotes,
      medicineTypes: entity.medicineTypes,
      isReminderActive: entity.isReminderActive,
      isFavorite: entity.isFavorite,
      image: entity.image,
      imageUrl: entity.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicineUsage': medicineUsage,
      'medicineName': medicineName,
      'frequency': frequency,
      'medicineNotes': medicineNotes,
      'medicineTypes': medicineTypes,
      'isReminderActive': isReminderActive,
      'isFavorite': isFavorite,
      'imageUrl': imageUrl,
    };
  }
}
