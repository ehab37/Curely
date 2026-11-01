part of 'manage_rays_cubit.dart';

@immutable
sealed class ManageRaysState {}

final class ManageRaysInitial extends ManageRaysState {}

final class ManageRaysLoading extends ManageRaysState {}

final class GetRaysFailure extends ManageRaysState {
  final String errMessage;

  GetRaysFailure(this.errMessage);
}

final class UpdateRaysFailure extends ManageRaysState {
  final String errMessage;

  UpdateRaysFailure(this.errMessage);
}

final class DeleteRaysFailure extends ManageRaysState {
  final String errMessage;

  DeleteRaysFailure(this.errMessage);
}

final class GetRaysSuccess extends ManageRaysState {
  final List<RaysEntity> rays;

  GetRaysSuccess(this.rays);
}

final class UpdateRaysSuccess extends ManageRaysState {}

final class DeleteRaysSuccess extends ManageRaysState {}
