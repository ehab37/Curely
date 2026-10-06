import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/global_cubits/active_profile_cubit/active_profile_cubit.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_prescriptions_state.dart';

class ManagePrescriptionsCubit extends Cubit<ManagePrescriptionsState> {
  ManagePrescriptionsCubit({
    required this.prescriptionRepo,
    required this.prescriptionNotificationRepo,
    required this.imagesRepo,
    required this.activeProfileCubit,
  }) : super(ManagePrescriptionsInitial());
  final PrescriptionRepo prescriptionRepo;
  final PrescriptionNotificationRepo prescriptionNotificationRepo;
  final ImagesRepo imagesRepo;
  final ActiveProfileCubit activeProfileCubit;

  String get profileId => activeProfileCubit.activeProfileId;

  Future<void> getPrescriptions({
    String? searchText,
    bool isFavoriteView = false,
  }) async {
    emit(ManagePrescriptionsLoading());
    var result = isFavoriteView
        ? await prescriptionRepo.getFavoritePrescriptions(profileId: profileId)
        : await prescriptionRepo.getPrescriptions(
            searchText: searchText,
            profileId: profileId,
          );
    result.fold(
      (failure) {
        emit(GetPrescriptionsFailure(failure.errMessage));
      },
      (prescriptions) {
        emit(GetPrescriptionsSuccess(prescriptions));
      },
    );
  }

  Future<void> updatePrescriptions({
    required PrescriptionEntity prescription,
  }) async {
    emit(ManagePrescriptionsLoading());
    var result = await prescriptionRepo.updatePrescription(
      prescription: prescription,
      profileId: profileId,
    );
    result.fold(
      (failure) {
        emit(UpdatePrescriptionsFailure(failure.errMessage));
        getPrescriptions();
      },
      (success) {
        emit(UpdatePrescriptionsSuccess());
        getPrescriptions();
      },
    );
  }

  Future<void> deletePrescriptions({
    required PrescriptionEntity prescription,
  }) async {
    emit(ManagePrescriptionsLoading());
    var result = await prescriptionNotificationRepo
        .cancelPrescriptionNotification(prescription: prescription);
    result.fold(
      (failure) {
        emit(CancelPrescriptionsNotificationFailure(failure.errMessage));
      },
      (_) async {
        var result2 = await prescriptionRepo.deletePrescription(
          prescription: prescription,
          profileId: profileId,
        );
        result2.fold(
          (failure) {
            emit(DeletePrescriptionsFailure(failure.errMessage));
          },
          (success) async {
            if (prescription.imageUrls.isNotNullOrEmpty) {
              await imagesRepo.deleteImages(urls: prescription.imageUrls!);
            }
            emit(DeletePrescriptionsSuccess());
            getPrescriptions();
          },
        );
      },
    );
  }
}
