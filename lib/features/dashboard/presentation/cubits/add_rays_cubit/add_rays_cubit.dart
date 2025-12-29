import 'package:curely/constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_rays_state.dart';

class AddRaysCubit extends Cubit<AddRaysState> {
  AddRaysCubit({required this.imagesRepo, required this.raysRepo})
    : super(AddRaysInitial());
  final ImagesRepo imagesRepo;
  final RaysRepo raysRepo;

  Future<void> addRays({required RaysEntity rays}) async {
    emit(AddRaysLoading());
    var result = await imagesRepo.uploadImage(
      imageFile: rays.image!,
      path: '${DatabaseKeys.imagesPath}/${DatabaseKeys.raysPath}',
    );
    result.fold(
      (failure) {
        emit(UploadImageFailure(failure.errMessage));
      },
      (url) async {
        rays.imageUrl = url;
        var result2 = await raysRepo.addRays(rays: rays);
        result2.fold(
          (failure) {
            emit(AddRaysFailure(failure.errMessage));
          },
          (success) {
            emit(AddRaysSuccess());
          },
        );
      },
    );
  }
}
