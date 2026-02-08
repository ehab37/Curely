import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit({
    required this.imagesRepo,
    required this.medicineRepo,
    required this.medicineNotificationRepo,
  }) : super(AddMedicineInitial());
  final ImagesRepo imagesRepo;
  final MedicineRepo medicineRepo;
  final MedicineNotificationRepo medicineNotificationRepo;
  List<TimeOfDay> remindersList = [];

  Future<void> addMedicine({required MedicineEntity medicine}) async {
    emit(AddMedicineLoading());
    if (medicine.image != null) {
      var result = await imagesRepo.uploadImage(
        imageFile: medicine.image!,
        path:
            '${DatabaseConstants.imagesPath}/${DatabaseConstants.medicinePath}',
      );
      result.fold(
        (failure) {
          emit(UploadImageFailure(failure.errMessage));
        },
        (url) async {
          medicine.imageUrl = url;
          await addMedicineAndNotification(medicine);
        },
      );
    } else {
      await addMedicineAndNotification(medicine);
    }
  }

  Future<void> addMedicineAndNotification(MedicineEntity medicine) async {
    var result2 = await medicineRepo.addMedicine(medicine: medicine);
    result2.fold(
      (failure) {
        emit(AddMedicineFailure(failure.errMessage));
      },
      (docId) async {
        if (medicine.isReminderActive) {
          var result3 = await medicineNotificationRepo.addMedicineNotification(
            docId: docId,
            medicine: medicine,
            remindersList: remindersList,
          );
          result3.fold((failure) {
            emit(AddMedicineNotificationFailure(failure.errMessage));
          }, (success) {});
        }
        emit(AddMedicineSuccess());
      },
    );
  }
}
