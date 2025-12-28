import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_delete_prescriptions_state.dart';

class GetDeletePrescriptionsCubit extends Cubit<GetDeletePrescriptionsState> {
  GetDeletePrescriptionsCubit({required this.prescriptionRepo})
    : super(GetDeletePrescriptionsInitial());
  final PrescriptionRepo prescriptionRepo;

  Future<void> getPrescriptions() async {
    emit(GetDeletePrescriptionsLoading());
    var result = await prescriptionRepo.getPrescriptions();
    result.fold(
      (failure) {
        emit(GetPrescriptionsFailure(failure.errMessage));
      },
      (prescriptions) {
        emit(GetPrescriptionsSuccess(prescriptions));
      },
    );
  }

  Future<void> deletePrescriptions({required String docId}) async {
    emit(GetDeletePrescriptionsLoading());
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
