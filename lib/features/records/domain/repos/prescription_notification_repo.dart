import 'package:curely/core/error/failures.dart';
import 'package:curely/features/records/domain/entities/prescription_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PrescriptionNotificationRepo {
  Future<Either<Failure, void>> addPrescriptionNotification({
    required PrescriptionEntity prescription,
  });

  Future<Either<Failure, void>> cancelPrescriptionNotification({
    required PrescriptionEntity prescription,
  });
}
