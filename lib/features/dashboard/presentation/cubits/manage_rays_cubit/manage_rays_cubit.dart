import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_rays_state.dart';

class ManageRaysCubit extends Cubit<ManageRaysState> {
  ManageRaysCubit({required this.raysRepo, required this.imagesRepo})
    : super(ManageRaysInitial());
  final RaysRepo raysRepo;
  final ImagesRepo imagesRepo;

  Future<void> getRays({
    String? searchText,
    bool isFavoriteView = false,
  }) async {
    emit(ManageRaysLoading());
    var result = isFavoriteView
        ? await raysRepo.getFavoriteRays()
        : await raysRepo.getRays(searchText: searchText);
    result.fold(
      (failure) {
        emit(GetRaysFailure(failure.errMessage));
      },
      (rays) {
        emit(GetRaysSuccess(rays));
      },
    );
  }

  Future<void> updateRays({required RaysEntity rays}) async {
    emit(ManageRaysLoading());
    var result = await raysRepo.updateRays(rays: rays);
    result.fold(
      (failure) {
        emit(UpdateRaysFailure(failure.errMessage));
        getRays();
      },
      (success) {
        emit(UpdateRaysSuccess());
        getRays();
      },
    );
  }

  Future<void> deleteRays({required RaysEntity rays}) async {
    emit(ManageRaysLoading());
    var result = await raysRepo.deleteRays(docId: rays.docId!);
    result.fold(
      (failure) {
        emit(DeleteRaysFailure(failure.errMessage));
        getRays();
      },
      (success) async {
        if (rays.imageUrls.isNotNullOrEmpty) {
          await imagesRepo.deleteImages(urls: rays.imageUrls!);
        }
        emit(DeleteRaysSuccess());
        getRays();
      },
    );
  }
}
