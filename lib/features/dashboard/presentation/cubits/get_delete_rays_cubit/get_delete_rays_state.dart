part of 'get_delete_rays_cubit.dart';

@immutable
sealed class GetDeleteRaysState {}

final class GetDeleteRaysInitial extends GetDeleteRaysState {}

final class GetDeleteRaysLoading extends GetDeleteRaysState {}

final class GetRaysFailure extends GetDeleteRaysState {
  final String errMessage;

  GetRaysFailure(this.errMessage);
}

final class DeleteRaysFailure extends GetDeleteRaysState {
  final String errMessage;

  DeleteRaysFailure(this.errMessage);
}

final class GetRaysSuccess extends GetDeleteRaysState {
  final List<RaysEntity> rays;

  GetRaysSuccess(this.rays);
}

final class DeleteRaysSuccess extends GetDeleteRaysState {}
