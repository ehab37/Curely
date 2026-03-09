import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PrescriptionRepo {
  Future<Either<Failure, void>> addPrescription({
    required PrescriptionEntity prescription,
  });

  Future<Either<Failure, List<PrescriptionEntity>>> getPrescriptions({
    String? searchText,
  });

  Future<Either<Failure, List<PrescriptionEntity>>> getFavoritePrescriptions();

  Future<Either<Failure, void>> deletePrescription({required String docId});

  Future<Either<Failure, void>> updatePrescription({
    required PrescriptionEntity prescription,
  });
}
