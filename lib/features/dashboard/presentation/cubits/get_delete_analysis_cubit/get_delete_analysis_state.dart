part of 'get_delete_analysis_cubit.dart';

@immutable
sealed class GetDeleteAnalysisState {}

final class GetDeleteAnalysisInitial extends GetDeleteAnalysisState {}

final class GetDeleteAnalysisLoading extends GetDeleteAnalysisState {}

final class GetAnalysisFailure extends GetDeleteAnalysisState {
  final String errMessage;

  GetAnalysisFailure(this.errMessage);
}

final class DeleteAnalysisFailure extends GetDeleteAnalysisState {
  final String errMessage;

  DeleteAnalysisFailure(this.errMessage);
}

final class GetAnalysisSuccess extends GetDeleteAnalysisState {
  final List<AnalysisEntity> analysis;

  GetAnalysisSuccess(this.analysis);
}

final class DeleteAnalysisSuccess extends GetDeleteAnalysisState {}
