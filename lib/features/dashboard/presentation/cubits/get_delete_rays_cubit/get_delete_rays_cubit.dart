import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_delete_rays_state.dart';

class GetDeleteRaysCubit extends Cubit<GetDeleteRaysState> {
  GetDeleteRaysCubit({required this.raysRepo}) : super(GetDeleteRaysInitial());
  final RaysRepo raysRepo;

  Future<void> getRays() async {
    emit(GetDeleteRaysLoading());
    var result = await raysRepo.getRays();
    result.fold(
      (failure) {
        emit(GetRaysFailure(failure.errMessage));
      },
      (rays) {
        emit(GetRaysSuccess(rays));
      },
    );
  }

  Future<void> deleteRays({required String docId}) async {
    emit(GetDeleteRaysLoading());
    var result = await raysRepo.deleteRays(docId: docId);
    result.fold(
      (failure) {
        emit(DeleteRaysFailure(failure.errMessage));
        getRays();
      },
      (rays) {
        emit(DeleteRaysSuccess());
        getRays();
      },
    );
  }
}
