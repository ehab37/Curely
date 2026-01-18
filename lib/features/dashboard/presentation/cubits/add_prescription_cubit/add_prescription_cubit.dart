import 'package:curely/constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_prescription_state.dart';

class AddPrescriptionCubit extends Cubit<AddPrescriptionState> {
  AddPrescriptionCubit({
    required this.imagesRepo,
    required this.prescriptionRepo,
  }) : super(AddPrescriptionInitial());
  final ImagesRepo imagesRepo;
  final PrescriptionRepo prescriptionRepo;

  Future<void> addPrescription({
    required PrescriptionEntity prescription,
  }) async {
    emit(AddPrescriptionLoading());
    var result = await imagesRepo.uploadImages(
      imageFiles: prescription.images!,
      path: '${DatabaseKeys.imagesPath}/${DatabaseKeys.prescriptionPath}',
    );
    result.fold(
      (failure) {
        emit(UploadImageFailure(failure.errMessage));
      },
      (urls) async {
        prescription.imageUrls = urls;
        var result2 = await prescriptionRepo.addPrescription(
          prescription: prescription,
        );
        result2.fold(
          (failure) {
            emit(AddPrescriptionFailure(failure.errMessage));
          },
          (success) {
            emit(AddPrescriptionSuccess());
          },
        );
      },
    );
  }
}
