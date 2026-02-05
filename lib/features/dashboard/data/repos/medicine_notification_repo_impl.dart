import 'dart:developer';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_default_reminders_list.dart';
import 'package:curely/core/services/notification_service.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class MedicineNotificationRepoImpl implements MedicineNotificationRepo {
  MedicineNotificationRepoImpl({required this.notificationService});

  final NotificationService notificationService;

  @override
  Future<Either<Failure, void>> addMedicineNotification({
    required String docId,
    required MedicineEntity medicine,
    required List<TimeOfDay> remindersList,
  }) async {
    try {
      int notificationId = docId.hashCode;
      for (int i = 0; i < remindersList.length; i++) {
        final TimeOfDay reminderTime = remindersList[i];
        final int uniqueNotificationId = notificationId + i;
        await notificationService.scheduleDailyReminder(
          id: uniqueNotificationId,
          title: 'Time for your medicine: ${medicine.medicineName}',
          body: 'Don\'t forget to take your dose! Tap to confirm.',
          time: reminderTime,
        );
        log(
          'Scheduled notification $i with ID $uniqueNotificationId at ${reminderTime.hour}',
        );
      }
      return Right(null);
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors(
          "Couldn't add the reminder, please try to add again",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cancelAllMedicineNotification({
    required MedicineEntity medicine,
  }) async {
    try {
      int remindersListLength = getDefaultRemindersList(
        medicine.frequency,
      ).length;
      if (medicine.isReminderActive) {
        for (int i = 0; i < remindersListLength; i++) {
          final int notificationId = medicine.docId.hashCode + i;
          await notificationService.cancelReminder(notificationId);
          log("Cancelled notification with ID: $notificationId");
        }
      }
      return Right(null);
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors("Couldn't cancel the reminder"));
    }
  }
}
