part of 'manage_prescriptions_cubit.dart';

@immutable
sealed class ManagePrescriptionsState {}

final class ManagePrescriptionsInitial extends ManagePrescriptionsState {}

final class ManagePrescriptionsLoading extends ManagePrescriptionsState {}

final class GetPrescriptionsFailure extends ManagePrescriptionsState {
  final String errMessage;

  GetPrescriptionsFailure(this.errMessage);
}

final class UpdatePrescriptionsFailure extends ManagePrescriptionsState {
  final String errMessage;

  UpdatePrescriptionsFailure(this.errMessage);
}

final class DeletePrescriptionsFailure extends ManagePrescriptionsState {
  final String errMessage;

  DeletePrescriptionsFailure(this.errMessage);
}

final class CancelPrescriptionsNotificationFailure
    extends ManagePrescriptionsState {
  final String errMessage;

  CancelPrescriptionsNotificationFailure(this.errMessage);
}

final class GetPrescriptionsSuccess extends ManagePrescriptionsState {
  final List<PrescriptionEntity> prescriptions;

  GetPrescriptionsSuccess(this.prescriptions);
}

final class UpdatePrescriptionsSuccess extends ManagePrescriptionsState {}

final class DeletePrescriptionsSuccess extends ManagePrescriptionsState {}
