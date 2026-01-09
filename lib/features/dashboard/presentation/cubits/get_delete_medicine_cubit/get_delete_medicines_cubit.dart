import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_delete_medicines_state.dart';

class GetDeleteMedicinesCubit extends Cubit<GetDeleteMedicinesState> {
  GetDeleteMedicinesCubit({
    required this.medicineRepo,
    required this.medicineNotificationRepo,
  }) : super(GetDeleteMedicinesInitial());
  final MedicineRepo medicineRepo;
  final MedicineNotificationRepo medicineNotificationRepo;

  Future<void> getMedicines() async {
    emit(GetDeleteMedicinesLoading());
    var result = await medicineRepo.getMedicines();
    result.fold(
      (failure) {
        emit(GetMedicinesFailure(failure.errMessage));
      },
      (medicines) {
        emit(GetMedicinesSuccess(medicines));
      },
    );
  }

  Future<void> deleteMedicines({required MedicineEntity medicine}) async {
    emit(GetDeleteMedicinesLoading());
    var result = await medicineRepo.deleteMedicine(docId: medicine.docId!);
    result.fold(
      (failure) {
        emit(DeleteMedicinesFailure(failure.errMessage));
        getMedicines();
      },
      (medicines) async {
        var result2 = await medicineNotificationRepo
            .cancelAllMedicineNotification(medicine: medicine);
        result2.fold(
          (failure) {
            emit(CancelMedicinesNotificationFailure(failure.errMessage));
            getMedicines();
          },
          (success) {
            emit(DeleteMedicinesSuccess());
            getMedicines();
          },
        );
      },
    );
  }
}
