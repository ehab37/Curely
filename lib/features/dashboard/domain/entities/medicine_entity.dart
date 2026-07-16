import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'record_details_item_entity.dart';

const List<String> medicineTypesList = [
  "tablet",
  "capsule",
  "syrup",
  "solution",
  "cream",
  "ointment",
  "gel",
  "lotion",
  "shampoo_foam",
  "spray",
  "inhaler",
  "injection",
  "supp",
  "ampoule",
  "vial",
  "eye_drop",
  "ear_drop",
  "nasal_drop",
  "oral_drop",
  "eye_ointment",
  "sachets",
  "mouth_wash",
  "soap",
  "enema",
  "vaginal_cream",
  "vaginal_supp",
  "vaginal_douche",
  "medical_supplies",
  "other",
];

const List<String> medicineUsagesList = [
  'anti_biotic',
  'anti_pyretics',
  'pain_killer',
  'tranquilizer',
  'laxative',
  'emetic',
  'tonic',
  'hypnotic',
  'appetiser',
  'anti_inflammatory',
  'anti_allergic',
  'anti_migraine',
  'anti_anaemic',
  'diuretic',
  'anti_fungal',
  'anti_diabetic',
  'anti_hypertensive',
  'circulatory_stimulant',
  'anti_bacterial',
  'aspirin',
  'other',
];

const List<String> frequencyList = [
  'once_daily',
  'twice_daily',
  'every_8_hours',
  'every_6_hours',
];

class MedicineEntity {
  String? docId;
  final String medicineUsage;
  final String medicineName;
  final String frequency;
  String? medicineNotes;
  final String medicineTypes;
  bool isReminderActive;
  bool isFavorite;
  final File? image;
  String? imageUrl;

  MedicineEntity({
    this.docId,
    required this.medicineUsage,
    required this.medicineName,
    required this.frequency,
    this.medicineNotes,
    required this.isReminderActive,
    this.isFavorite = false,
    required this.medicineTypes,
    this.image,
    this.imageUrl,
  });
}

List<RecordDetailsItemEntity> medicineDetailsList(
  BuildContext context,
  MedicineEntity medicine,
) => [
  RecordDetailsItemEntity(
    title: context.tr('medicine_name'),
    subTitle: medicine.medicineName,
    icon: FontAwesomeIcons.pills,
  ),
  RecordDetailsItemEntity(
    title: context.tr('medicine_type'),
    subTitle: context.tr(medicine.medicineTypes),
    icon: FontAwesomeIcons.prescriptionBottle,
  ),
  RecordDetailsItemEntity(
    title: context.tr('usage'),
    subTitle: context.tr(medicine.medicineUsage),
    icon: FontAwesomeIcons.fileLines,
  ),
  RecordDetailsItemEntity(
    title: context.tr('notes'),
    subTitle: medicine.medicineNotes ?? context.tr("no_notes"),
    icon: FontAwesomeIcons.notesMedical,
  ),
];
