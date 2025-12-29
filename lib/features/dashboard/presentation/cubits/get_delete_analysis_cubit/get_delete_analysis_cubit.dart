import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_delete_analysis_state.dart';

class GetDeleteAnalysisCubit extends Cubit<GetDeleteAnalysisState> {
  GetDeleteAnalysisCubit({required this.analysisRepo})
    : super(GetDeleteAnalysisInitial());
  final AnalysisRepo analysisRepo;

  Future<void> getAnalysis() async {
    emit(GetDeleteAnalysisLoading());
    var result = await analysisRepo.getAnalysis();
    result.fold(
      (failure) {
        emit(GetAnalysisFailure(failure.errMessage));
      },
      (analysis) {
        emit(GetAnalysisSuccess(analysis));
      },
    );
  }

  Future<void> deleteAnalysis({required String docId}) async {
    emit(GetDeleteAnalysisLoading());
    var result = await analysisRepo.deleteAnalysis(docId: docId);
    result.fold(
      (failure) {
        emit(DeleteAnalysisFailure(failure.errMessage));
        getAnalysis();
      },
      (analysis) {
        emit(DeleteAnalysisSuccess());
        getAnalysis();
      },
    );
  }
}
