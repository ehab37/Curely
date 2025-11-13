import 'dart:io';

import 'package:flutter/material.dart';

enum MedicineUsage {
  antiBiotic,
  antiPyretics,
  painKiller,
  tranquilizer,
  laxative,
  emetic,
  tonic,
  hypnotic,
  appetiser,
  antiInfammatory,
  antiAllergic,
  antiMigraine,
  antiAnaemic,
  diuretic,
  antiFungal,
  antiDiabetic,
  antiHypertensive,
  circulatoryStimulant,
  antiBacterial,
  aspirin,
  other,
}

enum MedicineTypes {
  tablets,
  capsules,
  inhalation,
  syrup,
  supp,
  ampoule,
  vial,
  injection,
  eyeDrops,
  earDrops,
  nasalDrops,
  oralDrops,
  cream,
  oint,
  gel,
  eyeOInt,
  spray,
  solution,
  sachets,
  mouthWash,
  lotion,
  soap,
  enema,
  vagCream,
  vagSupp,
  vagDouche,
  medicalSupplies,
  other,
}
List<MedicineModel> medicineItems = [];

class MedicineModel {
  final MedicineUsage medicineUsage;
  final String medicineName;
  final int timesNumber;
  final String medicineDescription;
  final MedicineTypes medicineTypes;
  final bool isReminderActive;
  final TimeOfDay startReminderTime;
  final File image;

  MedicineModel({
    required this.medicineUsage,
    required this.medicineName,
    required this.timesNumber,
    required this.medicineDescription,
    required this.isReminderActive,
    required this.startReminderTime,
    required this.medicineTypes,
    required this.image,
  });
}
