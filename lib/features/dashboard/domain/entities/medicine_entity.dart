import 'dart:io';

import 'package:flutter/material.dart';

const List<String> medicineTypesList = [
  "Tablet",
  "Capsule",
  "Syrup",
  "Solution",
  "Cream",
  "Ointment",
  "Gel",
  "Lotion",
  "Shampoo/Foam",
  "Spray",
  "Inhaler",
  "Injection",
  "Supp",
  "Ampoule",
  "Vial",
  "Eye Drop",
  "Ear Drop",
  "Nasal Drop",
  "Oral Drop",
  "Eye Ointment",
  "Sachets",
  "Mouth Wash",
  "Soap",
  "Enema",
  "Vaginal Cream",
  "Vaginal Supp",
  "Vaginal Douche",
  "Medical Supplies",
  "Other",
];

const List<String> medicineUsagesList = [
  'Anti Biotic',
  'Anti Pyretics',
  'PainKiller',
  'Tranquilizer',
  'Laxative',
  'Emetic',
  'Tonic',
  'Hypnotic',
  'Appetiser',
  'Anti Inflammatory',
  'Anti Allergic',
  'Anti Migraine',
  'Anti Anaemic',
  'Diuretic',
  'Anti Fungal',
  'Anti Diabetic',
  'Anti Hypertensive',
  'Circulatory Stimulant',
  'Anti Bacterial',
  'Aspirin',
  'Other',
];

const List<String> frequencyList = [
  'Once Daily',
  'Twice Daily',
  'Every 8 Hours',
  'Every 6 Hours',
];

List<MedicineEntity> medicineItems = [];

class MedicineEntity {
  final String medicineUsage;
  final String medicineName;
  final String frequency;
  final String? medicineNotes;
  final String medicineTypes;
  final bool isReminderActive;
  final List<TimeOfDay?>? remindersTime;
  final File? image;
  String? imageUrl;

  MedicineEntity({
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
}
