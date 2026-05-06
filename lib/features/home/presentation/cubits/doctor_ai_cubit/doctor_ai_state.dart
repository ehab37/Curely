part of 'doctor_ai_cubit.dart';

@immutable
sealed class DoctorAiState {}

final class DoctorAiInitial extends DoctorAiState {}

final class DoctorAiMessageReceived extends DoctorAiState {}

final class DoctorAiTypingState extends DoctorAiState {}

final class DoctorAiFailure extends DoctorAiState {
  final String errMessage;

  DoctorAiFailure({required this.errMessage});
}
