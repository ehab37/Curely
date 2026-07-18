import 'dart:developer';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helpers/get_default_reminders_list.dart';
import 'package:curely/core/services/local_notifications_service.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MedicineNotificationRepoImpl implements MedicineNotificationRepo {
  MedicineNotificationRepoImpl({required this.notificationService});

  final LocalNotificationsService notificationService;

  @override
  Future<Either<Failure, void>> addMedicineNotification({
    required MedicineEntity medicine,
    required List<TimeOfDay> remindersList,
  }) async {
    try {
      int notificationId = medicine.docId.hashCode;
      final now = DateTime.now();
      for (int i = 0; i < remindersList.length; i++) {
        final TimeOfDay reminderTime = remindersList[i];
        var scheduledDate = DateTime(
          now.year,
          now.month,
          now.day,
          reminderTime.hour,
          reminderTime.minute,
        );
        if (scheduledDate.isBefore(now)) {
          scheduledDate = scheduledDate.add(const Duration(days: 1));
        }
        final int uniqueNotificationId = notificationId + i;
        await notificationService.zonedScheduleNotification(
          id: uniqueNotificationId,
          title: "medicine_notification_title".tr(
            args: [medicine.medicineName],
          ),
          body: "medicine_notification_body".tr(),
          channelId: 'daily_meds',
          channelName: 'Daily Meds',
          date: scheduledDate,
          payload: AppRoutesConstants.kDisplayMedicineView,
        );
        log(
          'Scheduled notification $i with ID $uniqueNotificationId at ${reminderTime.hour}',
        );
      }
      return Right(null);
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("add_medicine_reminder_error".tr()),
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
      return Left(OtherErrors.fromOtherErrors("cancel_reminder_error".tr()));
    }
  }
}
