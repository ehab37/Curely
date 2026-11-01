part of 'add_analysis_cubit.dart';

@immutable
sealed class AddAnalysisState {}

final class AddAnalysisInitial extends AddAnalysisState {}

final class AddAnalysisLoading extends AddAnalysisState {}

final class AddAnalysisFailure extends AddAnalysisState {
  final String errMessage;

  AddAnalysisFailure(this.errMessage);
}

final class UploadImageFailure extends AddAnalysisState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}

final class AddAnalysisSuccess extends AddAnalysisState {}
