import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_delete_medicines_state.dart';

class GetDeleteMedicinesCubit extends Cubit<GetDeleteMedicinesState> {
  GetDeleteMedicinesCubit({required this.medicineRepo})
    : super(GetDeleteMedicinesInitial());
  final MedicineRepo medicineRepo;

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
  Future<void> deleteMedicines({required String docId}) async {
    emit(GetDeleteMedicinesLoading());
    var result = await medicineRepo.deleteMedicine(docId: docId);
    result.fold(
      (failure) {
        emit(DeleteMedicinesFailure(failure.errMessage));
        getMedicines();
      },
      (medicines) {
        emit(DeleteMedicinesSuccess());
        getMedicines();
      },
    );
  }
}
