import 'package:curely/core/repos/images_repo/images_repo.dart';
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
    required this.imagesRepo,
  }) : super(ManageMedicinesInitial());
  final MedicineRepo medicineRepo;
  final MedicineNotificationRepo medicineNotificationRepo;
  final ImagesRepo imagesRepo;

  Future<void> getMedicines({
    String? searchText,
    bool isRemindersView = false,
    bool isFavoriteView = false,
  }) async {
    emit(ManageMedicinesLoading());
    var result = isRemindersView
        ? await medicineRepo.getReminderMedicines()
        : isFavoriteView
        ? await medicineRepo.getFavoriteMedicines()
        : await medicineRepo.getMedicines(searchText: searchText);
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
    var result = await medicineNotificationRepo.cancelAllMedicineNotification(
      medicine: medicine,
    );
    result.fold(
      (failure) {
        emit(CancelMedicinesNotificationFailure(failure.errMessage));
      },
      (_) async {
        var result2 = await medicineRepo.deleteMedicine(docId: medicine.docId!);
        result2.fold(
          (failure) {
            emit(DeleteMedicinesFailure(failure.errMessage));
            updateMedicines(medicine: medicine..isReminderActive = false);
          },
          (success) async {
            if (medicine.imageUrl != null) {
              await imagesRepo.deleteImage(url: medicine.imageUrl!);
            }
            emit(DeleteMedicinesSuccess());
            getMedicines();
          },
        );
      },
    );
  }

  Future<void> stopMedicineReminder({required MedicineEntity medicine}) async {
    emit(ManageMedicinesLoading());
    var result = await medicineNotificationRepo.cancelAllMedicineNotification(
      medicine: medicine,
    );
    result.fold(
      (failure) {
        emit(CancelMedicinesNotificationFailure(failure.errMessage));
      },
      (success) async {
        await updateMedicines(medicine: medicine..isReminderActive = false);
      },
    );
  }
}
