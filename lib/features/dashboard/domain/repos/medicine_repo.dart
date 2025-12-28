import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MedicineRepo {
  Future<Either<Failure, void>> addMedicine({required MedicineEntity medicine});
  Future<Either<Failure, List<MedicineEntity>>> getMedicines();
  Future<Either<Failure, void>> deleteMedicine({required String docId});
}
