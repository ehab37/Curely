import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/profile/domain/repos/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_profile_state.dart';

class ManageProfileCubit extends Cubit<ManageProfileState> {
  ManageProfileCubit({
    required this.profileRepo,
    required this.imagesRepo,
    required this.authRepo,
  }) : super(ManageProfileInitial());
  final ProfileRepo profileRepo;
  final ImagesRepo imagesRepo;
  final AuthRepo authRepo;

  Future<void> editProfile({required UserEntity user}) async {
    emit(ManageProfileLoading());
    if (user.image != null) {
      var result = await imagesRepo.uploadImage(
        imageFile: user.image!,
        path:
            '${DatabaseConstants.imagesPath}/${DatabaseConstants.profilePath}',
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

  Future<void> deleteAccount({required String uId}) async {
    emit(ManageProfileLoading());
    final result = await authRepo.deleteAccount(uId: uId);
    result.fold(
      (l) => emit(DeleteAccountFailure(errMessage: l.errMessage)),
      (r) => emit(DeleteAccountSuccess()),
    );
  }
}
