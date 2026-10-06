import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PrescriptionRepo {
  Future<Either<Failure, String>> addPrescription({
    required PrescriptionEntity prescription,
    required String profileId,
  });

  Future<Either<Failure, List<PrescriptionEntity>>> getPrescriptions({
    String? searchText,
    required String profileId,
  });

  Future<Either<Failure, List<PrescriptionEntity>>> getFavoritePrescriptions({
    required String profileId,
  });

  Future<Either<Failure, void>> deletePrescription({
    required PrescriptionEntity prescription,
    required String profileId,
  });

  Future<Either<Failure, void>> updatePrescription({
    required PrescriptionEntity prescription,
    required String profileId,
  });
}
