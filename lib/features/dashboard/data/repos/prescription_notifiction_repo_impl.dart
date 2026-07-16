import 'dart:developer';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/services/local_notifications_service.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class PrescriptionNotificationRepoImpl implements PrescriptionNotificationRepo {
  PrescriptionNotificationRepoImpl({required this.notificationService});

  final LocalNotificationsService notificationService;

  @override
  Future<Either<Failure, void>> addPrescriptionNotification({
    required PrescriptionEntity prescription,
    required DateTime nextAppointmentDate,
  }) async {
    try {
      final exactDate = nextAppointmentDate.copyWith(hour: 11);
      final notificationId = prescription.docId.hashCode;
      for (int i = 0; i < 2; i++) {
        await notificationService.zonedScheduleNotification(
          id: notificationId + i,
          title: "prescription_notification_title".tr(
            args: [prescription.doctorName],
          ),
          body: i == 0
              ? "prescription_notification_body_today".tr()
              : "prescription_notification_body_tomorrow".tr(),
          channelId: 'next_appointment',
          channelName: 'Next Appointment',
          date: exactDate.subtract(Duration(days: i)),
          daily: false,
          payload: AppRoutesConstants.kDisplayPrescriptionView,
        );
        log(
          'Scheduled notification $i with ID ${notificationId + i} at ${exactDate.subtract(Duration(days: i))}',
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
}
