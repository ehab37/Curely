import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_medicines_state.dart';

class ManageMedicinesCubit extends Cubit<ManageMedicinesState> {
  ManageMedicinesCubit({
    required this.medicineRepo,
    required this.medicineNotificationRepo,
  }) : super(ManageMedicinesInitial());
  final MedicineRepo medicineRepo;
  final MedicineNotificationRepo medicineNotificationRepo;
  bool isReminderView = false;

  Future<void> getMedicines() async {
    emit(ManageMedicinesLoading());
    var result = isReminderView
        ? await medicineRepo.getReminderMedicines()
        : await medicineRepo.getMedicines();
    result.fold(
      (failure) {
        emit(GetMedicinesFailure(failure.errMessage));
      },
      (medicines) {
        emit(GetMedicinesSuccess(medicines));
      },
    );
  }

  Future<void> updateMedicines({required MedicineEntity medicine}) async {
    emit(ManageMedicinesLoading());
    var result = await medicineRepo.updateMedicine(medicine: medicine);
    result.fold(
      (failure) {
        emit(UpdateMedicinesFailure(failure.errMessage));
        getMedicines();
      },
      (success) {
        emit(UpdateMedicinesSuccess());
        getMedicines();
      },
    );
  }

  Future<void> deleteMedicines({required MedicineEntity medicine}) async {
    emit(ManageMedicinesLoading());
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
