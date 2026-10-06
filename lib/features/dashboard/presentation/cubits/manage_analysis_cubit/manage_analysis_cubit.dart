import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/global_cubits/active_profile_cubit/active_profile_cubit.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_analysis_state.dart';

class ManageAnalysisCubit extends Cubit<ManageAnalysisState> {
  ManageAnalysisCubit({
    required this.analysisRepo,
    required this.imagesRepo,
    required this.activeProfileCubit,
  }) : super(ManageAnalysisInitial());
  final AnalysisRepo analysisRepo;
  final ImagesRepo imagesRepo;
  final ActiveProfileCubit activeProfileCubit;

  String get profileId => activeProfileCubit.activeProfileId;

  Future<void> getAnalysis({
    String? searchText,
    bool isFavoriteView = false,
  }) async {
    emit(ManageAnalysisLoading());
    var result = isFavoriteView
        ? await analysisRepo.getFavoriteAnalysis(profileId: profileId)
        : await analysisRepo.getAnalysis(
            searchText: searchText,
            profileId: profileId,
          );
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
    var result = await analysisRepo.updateAnalysis(
      analysis: analysis,
      profileId: profileId,
    );
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
    var result = await analysisRepo.deleteAnalysis(
      analysis: analysis,
      profileId: profileId,
    );
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
