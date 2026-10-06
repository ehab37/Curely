part of 'manage_dependents_cubit.dart';

@immutable
sealed class ManageDependentsState {}

final class ManageDependentsInitial extends ManageDependentsState {}

final class ManageDependentsLoading extends ManageDependentsState {}

final class GetDependentsSuccess extends ManageDependentsState {
  final List<DependentEntity> dependents;

  GetDependentsSuccess(this.dependents);
}

final class GetDependentsFailure extends ManageDependentsState {
  final String errMessage;

  GetDependentsFailure(this.errMessage);
}

final class AddDependentSuccess extends ManageDependentsState {}

final class AddDependentFailure extends ManageDependentsState {
  final String errMessage;

  AddDependentFailure(this.errMessage);
}

final class UpdateDependentSuccess extends ManageDependentsState {}

final class UpdateDependentFailure extends ManageDependentsState {
  final String errMessage;

  UpdateDependentFailure(this.errMessage);
}

final class DeleteDependentSuccess extends ManageDependentsState {}

final class DeleteDependentFailure extends ManageDependentsState {
  final String errMessage;

  DeleteDependentFailure(this.errMessage);
}
