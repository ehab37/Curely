import 'package:curely/core/global_cubits/active_profile_cubit/active_profile_cubit.dart';
import 'package:curely/features/profile/domain/entities/dependent_entity.dart';
import 'package:curely/features/profile/domain/repos/dependents_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_dependents_state.dart';

class ManageDependentsCubit extends Cubit<ManageDependentsState> {
  final DependentsRepo dependentsRepo;
  final ActiveProfileCubit activeProfileCubit;

  ManageDependentsCubit({
    required this.dependentsRepo,
    required this.activeProfileCubit,
  }) : super(ManageDependentsInitial());

  Future<void> getDependents() async {
    emit(ManageDependentsLoading());
    var result = await dependentsRepo.getDependents();
    result.fold(
      (failure) => emit(GetDependentsFailure(failure.errMessage)),
      (dependents) => emit(GetDependentsSuccess(dependents)),
    );
  }

  Future<void> addDependent({required DependentEntity dependent}) async {
    emit(ManageDependentsLoading());
    var result = await dependentsRepo.addDependent(dependent: dependent);
    result.fold(
      (failure) {
        emit(AddDependentFailure(failure.errMessage));
        getDependents();
      },
      (id) {
        emit(AddDependentSuccess());
        getDependents();
      },
    );
  }

  Future<void> updateDependent({required DependentEntity dependent}) async {
    emit(ManageDependentsLoading());
    var result = await dependentsRepo.updateDependent(dependent: dependent);
    result.fold(
      (failure) {
        emit(UpdateDependentFailure(failure.errMessage));
        getDependents();
      },
      (success) {
        emit(UpdateDependentSuccess());
        getDependents();
      },
    );
  }

  Future<void> deleteDependent({required DependentEntity dependent}) async {
    emit(ManageDependentsLoading());
    var result = await dependentsRepo.deleteDependent(dependent: dependent);
    result.fold(
      (failure) {
        emit(DeleteDependentFailure(failure.errMessage));
        getDependents();
      },
      (success) {
        if (activeProfileCubit.activeProfileId == dependent.docId) {
          activeProfileCubit.resetToOwner();
        }
        emit(DeleteDependentSuccess());
        getDependents();
      },
    );
  }
}
