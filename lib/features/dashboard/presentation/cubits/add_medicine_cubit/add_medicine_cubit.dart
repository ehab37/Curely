import 'package:curely/constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit({required this.imagesRepo, required this.medicineRepo})
    : super(AddMedicineInitial());
  final ImagesRepo imagesRepo;
  final MedicineRepo medicineRepo;

  Future<void> addMedicine({required MedicineEntity medicine}) async {
    emit(AddMedicineLoading());
    if (medicine.image != null) {
      var result = await imagesRepo.uploadImage(
        imageFile: medicine.image!,
        path: '${DatabaseKeys.imagesPath}/${DatabaseKeys.medicinePath}',
      );
      result.fold(
        (failure) {
          emit(UploadImageFailure(failure.errMessage));
        },
        (url) async {
          medicine.imageUrl = url;
          var result2 = await medicineRepo.addMedicine(medicine: medicine);
          result2.fold(
            (failure) {
              emit(AddMedicineFailure(failure.errMessage));
            },
            (success) {
              emit(AddMedicineSuccess());
            },
          );
        },
      );
    } else {
      var result2 = await medicineRepo.addMedicine(medicine: medicine);
      result2.fold(
        (failure) {
          emit(AddMedicineFailure(failure.errMessage));
        },
        (success) {
          emit(AddMedicineSuccess());
        },
      );
    }
  }
}
