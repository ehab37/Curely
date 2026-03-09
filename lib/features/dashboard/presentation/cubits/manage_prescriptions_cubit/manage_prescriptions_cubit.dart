import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_prescriptions_state.dart';

class ManagePrescriptionsCubit extends Cubit<ManagePrescriptionsState> {
  ManagePrescriptionsCubit({required this.prescriptionRepo})
    : super(ManagePrescriptionsInitial());
  final PrescriptionRepo prescriptionRepo;
  bool isFavoriteView = false;

  Future<void> getPrescriptions({String? searchText}) async {
    emit(ManagePrescriptionsLoading());
    var result = isFavoriteView
        ? await prescriptionRepo.getFavoritePrescriptions()
        : await prescriptionRepo.getPrescriptions(searchText: searchText);
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

  Future<void> deletePrescriptions({required String docId}) async {
    emit(ManagePrescriptionsLoading());
    var result = await prescriptionRepo.deletePrescription(docId: docId);
    result.fold(
      (failure) {
        emit(DeletePrescriptionsFailure(failure.errMessage));
        getPrescriptions();
      },
      (prescriptions) {
        emit(DeletePrescriptionsSuccess());
        getPrescriptions();
      },
    );
  }
}
