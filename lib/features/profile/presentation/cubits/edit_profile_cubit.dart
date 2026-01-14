import 'package:curely/constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/profile/domain/repos/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.profileRepo, required this.imagesRepo})
    : super(EditProfileInitial());
  final ProfileRepo profileRepo;
  final ImagesRepo imagesRepo;

  Future<void> editProfile({required UserEntity user}) async {
    emit(EditProfileLoading());
    if (user.image != null) {
      var result = await imagesRepo.uploadImage(
        imageFile: user.image!,
        path: '${DatabaseKeys.imagesPath}/${DatabaseKeys.profilePath}',
      );
      result.fold(
        (failure) {
          emit(UploadImageFailure(errMessage: failure.errMessage));
        },
        (url) async {
          user.imageUrl = url;
          var result2 = await profileRepo.editUserData(user: user);
          result2.fold(
            (l) => emit(EditProfileFailure(errMessage: l.errMessage)),
            (r) => emit(EditProfileSuccess()),
          );
        },
      );
    } else {
      var result2 = await profileRepo.editUserData(user: user);
      result2.fold(
        (l) => emit(EditProfileFailure(errMessage: l.errMessage)),
        (r) => emit(EditProfileSuccess()),
      );
    }
  }
}
