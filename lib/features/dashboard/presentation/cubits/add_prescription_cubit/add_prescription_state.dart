part of 'add_prescription_cubit.dart';

@immutable
sealed class AddPrescriptionState {}

final class AddPrescriptionInitial extends AddPrescriptionState {}

final class AddPrescriptionLoading extends AddPrescriptionState {}

final class AddPrescriptionFailure extends AddPrescriptionState {
  final String errMessage;

  AddPrescriptionFailure(this.errMessage);
}

final class UploadImageFailure extends AddPrescriptionState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}

final class AddPrescriptionSuccess extends AddPrescriptionState {}
