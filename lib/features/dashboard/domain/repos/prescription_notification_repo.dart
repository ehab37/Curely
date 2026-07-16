import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PrescriptionNotificationRepo {
  Future<Either<Failure, void>> addPrescriptionNotification({
    required PrescriptionEntity prescription,
    required DateTime nextAppointmentDate,
  });
}
