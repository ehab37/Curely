part of 'get_delete_prescriptions_cubit.dart';

@immutable
sealed class GetDeletePrescriptionsState {}

final class GetDeletePrescriptionsInitial extends GetDeletePrescriptionsState {}

final class GetDeletePrescriptionsLoading extends GetDeletePrescriptionsState {}

final class GetPrescriptionsFailure extends GetDeletePrescriptionsState {
  final String errMessage;

  GetPrescriptionsFailure(this.errMessage);
}

final class DeletePrescriptionsFailure extends GetDeletePrescriptionsState {
  final String errMessage;

  DeletePrescriptionsFailure(this.errMessage);
}

final class GetPrescriptionsSuccess extends GetDeletePrescriptionsState {
  final List<PrescriptionEntity> prescriptions;

  GetPrescriptionsSuccess(this.prescriptions);
}

final class DeletePrescriptionsSuccess extends GetDeletePrescriptionsState {}
