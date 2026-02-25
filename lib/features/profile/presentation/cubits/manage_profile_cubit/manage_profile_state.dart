part of 'manage_profile_cubit.dart';

@immutable
sealed class ManageProfileState {}

final class ManageProfileInitial extends ManageProfileState {}

final class ManageProfileLoading extends ManageProfileState {}

final class EditProfileSuccess extends ManageProfileState {}

final class DeleteAccountSuccess extends ManageProfileState {}

final class EditProfileFailure extends ManageProfileState {
  final String errMessage;

  EditProfileFailure({required this.errMessage});
}

final class DeleteAccountFailure extends ManageProfileState {
  final String errMessage;

  DeleteAccountFailure({required this.errMessage});
}

final class UploadImageFailure extends ManageProfileState {
  final String errMessage;

  UploadImageFailure({required this.errMessage});
}
