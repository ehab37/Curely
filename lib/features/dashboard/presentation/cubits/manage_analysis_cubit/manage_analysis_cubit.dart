import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_analysis_state.dart';

class ManageAnalysisCubit extends Cubit<ManageAnalysisState> {
  ManageAnalysisCubit({required this.analysisRepo, required this.imagesRepo})
    : super(ManageAnalysisInitial());
  final AnalysisRepo analysisRepo;
  final ImagesRepo imagesRepo;

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
    var result = await analysisRepo.deleteAnalysis(docId: analysis.docId!);
    result.fold(
      (failure) {
        emit(DeleteAnalysisFailure(failure.errMessage));
        getAnalysis();
      },
      (success) async {
        if (analysis.imageUrls.isNotNullOrEmpty) {
          await imagesRepo.deleteImages(urls: analysis.imageUrls!);
        }
        emit(DeleteAnalysisSuccess());
        getAnalysis();
      },
    );
  }
}
