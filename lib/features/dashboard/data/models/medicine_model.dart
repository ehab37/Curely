import 'dart:io';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:flutter/material.dart';

class MedicineModel {
  final String medicineUsage;
  final String medicineName;
  final String frequency;
  final String? medicineNotes;
  final String medicineTypes;
  final bool isReminderActive;
  final List<TimeOfDay?>? remindersTime;
  final File? image;
  String? imageUrl;

  MedicineModel({
    required this.medicineUsage,
    required this.medicineName,
    required this.frequency,
    this.medicineNotes,
    required this.isReminderActive,
    this.remindersTime,
    required this.medicineTypes,
    this.image,
    this.imageUrl,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      medicineUsage: json['medicineUsage'],
      medicineName: json['medicineName'],
      frequency: json['frequency'],
      medicineNotes: json['medicineNotes'],
      isReminderActive: json['isReminderActive'],
      remindersTime: json['remindersTime'],
      medicineTypes: json['medicineTypes'],
      imageUrl: json['imageUrl'],
    );
  }

  factory MedicineModel.fromEntity(MedicineEntity entity) {
    return MedicineModel(
      medicineUsage: entity.medicineUsage,
      medicineName: entity.medicineName,
      frequency: entity.frequency,
      medicineNotes: entity.medicineNotes,
      isReminderActive: entity.isReminderActive,
      remindersTime: entity.remindersTime,
      medicineTypes: entity.medicineTypes,
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
      'isReminderActive': isReminderActive,
      'remindersTime': remindersTime,
      'medicineTypes': medicineTypes,
      'imageUrl': imageUrl,
    };
  }
}
