import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class MedicineNotificationRepo {
  Future<Either<Failure, void>> addMedicineNotification({
    required String docId,
    required MedicineEntity medicine,
    required List<TimeOfDay> remindersList,
  });

  Future<Either<Failure, void>> cancelAllMedicineNotification({
    required MedicineEntity medicine,
  });
}
