import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_prescription_state.dart';

class AddPrescriptionCubit extends Cubit<AddPrescriptionState> {
  AddPrescriptionCubit({
    required this.imagesRepo,
    required this.prescriptionRepo,
    required this.prescriptionNotificationRepo,
  }) : super(AddPrescriptionInitial());
  final ImagesRepo imagesRepo;
  final PrescriptionRepo prescriptionRepo;
  final PrescriptionNotificationRepo prescriptionNotificationRepo;
  DateTime? nextAppointmentDate;

  void updateNextAppointmentDate(DateTime? date) {
    nextAppointmentDate = date;
    emit(AddPrescriptionInitial());
  }

  Future<void> addPrescription({
    required PrescriptionEntity prescription,
  }) async {
    emit(AddPrescriptionLoading());
    var result = await imagesRepo.uploadImages(
      imageFiles: prescription.images!,
      path:
          '${DatabaseConstants.recordsPath}/${DatabaseConstants.prescriptionPath}',
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
          (failure) async {
            if (prescription.imageUrls.isNotNullOrEmpty) {
              await imagesRepo.deleteImages(urls: prescription.imageUrls!);
            }
            emit(AddPrescriptionFailure(failure.errMessage));
          },
          (docId) async {
            prescription.docId = docId;
            if (prescription.nextAppointmentDate != null) {
              var result3 = await prescriptionNotificationRepo
                  .addPrescriptionNotification(prescription: prescription);
              result3.fold((failure) {
                emit(AddPrescriptionNotificationFailure(failure.errMessage));
              }, (success) {});
            }
            emit(AddPrescriptionSuccess());
          },
        );
      },
    );
  }
}
