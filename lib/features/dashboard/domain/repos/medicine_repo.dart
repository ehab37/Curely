import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MedicineRepo {
  Future<Either<Failure, String>> addMedicine({
    required MedicineEntity medicine,
    required String profileId,
  });

  Future<Either<Failure, List<MedicineEntity>>> getMedicines({
    String? searchText,
    required String profileId,
  });

  Future<Either<Failure, List<MedicineEntity>>> getReminderMedicines({
    required String profileId,
  });

  Future<Either<Failure, List<MedicineEntity>>> getFavoriteMedicines({
    required String profileId,
  });

  Future<Either<Failure, void>> deleteMedicine({
    required MedicineEntity medicine,
    required String profileId,
  });

  Future<Either<Failure, void>> updateMedicine({
    required MedicineEntity medicine,
    required String profileId,
  });
}
