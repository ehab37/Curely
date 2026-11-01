part of 'add_rays_cubit.dart';

@immutable
sealed class AddRaysState {}

final class AddRaysInitial extends AddRaysState {}

final class AddRaysLoading extends AddRaysState {}

final class AddRaysFailure extends AddRaysState {
  final String errMessage;

  AddRaysFailure(this.errMessage);
}

final class UploadImageFailure extends AddRaysState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}

final class AddRaysSuccess extends AddRaysState {}
