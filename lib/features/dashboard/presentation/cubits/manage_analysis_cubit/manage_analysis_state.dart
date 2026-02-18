part of 'manage_analysis_cubit.dart';

@immutable
sealed class ManageAnalysisState {}

final class ManageAnalysisInitial extends ManageAnalysisState {}

final class ManageAnalysisLoading extends ManageAnalysisState {}

final class GetAnalysisFailure extends ManageAnalysisState {
  final String errMessage;

  GetAnalysisFailure(this.errMessage);
}

final class UpdateAnalysisFailure extends ManageAnalysisState {
  final String errMessage;

  UpdateAnalysisFailure(this.errMessage);
}

final class DeleteAnalysisFailure extends ManageAnalysisState {
  final String errMessage;

  DeleteAnalysisFailure(this.errMessage);
}

final class GetAnalysisSuccess extends ManageAnalysisState {
  final List<AnalysisEntity> analysis;

  GetAnalysisSuccess(this.analysis);
}

final class UpdateAnalysisSuccess extends ManageAnalysisState {}

final class DeleteAnalysisSuccess extends ManageAnalysisState {}
