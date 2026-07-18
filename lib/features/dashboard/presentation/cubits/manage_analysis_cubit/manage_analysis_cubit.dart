import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_analysis_state.dart';

class ManageAnalysisCubit extends Cubit<ManageAnalysisState> {
  ManageAnalysisCubit({required this.analysisRepo})
    : super(ManageAnalysisInitial());
  final AnalysisRepo analysisRepo;

  Future<void> getAnalysis({
    String? searchText,
    bool isFavoriteView = false,
  }) async {
    emit(ManageAnalysisLoading());
    var result = isFavoriteView
        ? await analysisRepo.getFavoriteAnalysis()
        : await analysisRepo.getAnalysis(searchText: searchText);
    result.fold(
      (failure) {
        emit(GetAnalysisFailure(failure.errMessage));
      },
      (analysis) {
        emit(GetAnalysisSuccess(analysis));
      },
    );
  }

  Future<void> updateAnalysis({required AnalysisEntity analysis}) async {
    emit(ManageAnalysisLoading());
    var result = await analysisRepo.updateAnalysis(analysis: analysis);
    result.fold(
      (failure) {
        emit(UpdateAnalysisFailure(failure.errMessage));
        getAnalysis();
      },
      (success) {
        emit(UpdateAnalysisSuccess());
        getAnalysis();
      },
    );
  }

  Future<void> deleteAnalysis({required AnalysisEntity analysis}) async {
    emit(ManageAnalysisLoading());
    var result = await analysisRepo.deleteAnalysis(analysis: analysis);
    result.fold(
      (failure) {
        emit(DeleteAnalysisFailure(failure.errMessage));
        getAnalysis();
      },
      (success) {
        emit(DeleteAnalysisSuccess());
        getAnalysis();
      },
    );
  }
}
