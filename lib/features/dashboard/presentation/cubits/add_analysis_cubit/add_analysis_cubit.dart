import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/global_cubits/active_profile_cubit/active_profile_cubit.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_analysis_state.dart';

class AddAnalysisCubit extends Cubit<AddAnalysisState> {
  AddAnalysisCubit({
    required this.imagesRepo,
    required this.analysisRepo,
    required this.activeProfileCubit,
  }) : super(AddAnalysisInitial());
  final ImagesRepo imagesRepo;
  final AnalysisRepo analysisRepo;
  final ActiveProfileCubit activeProfileCubit;

  String get profileId => activeProfileCubit.activeProfileId;

  Future<void> addAnalysis({required AnalysisEntity analysis}) async {
    emit(AddAnalysisLoading());
    var result = await imagesRepo.uploadImages(
      imageFiles: analysis.images!,
      path:
          '${DatabaseConstants.recordsPath}/${DatabaseConstants.analysisPath}',
    );
    result.fold(
      (failure) {
        emit(UploadImageFailure(failure.errMessage));
      },
      (urls) async {
        analysis.imageUrls = urls;
        var result2 = await analysisRepo.addAnalysis(
          analysis: analysis,
          profileId: profileId,
        );
        result2.fold(
          (failure) async {
            if (analysis.imageUrls.isNotNullOrEmpty) {
              await imagesRepo.deleteImages(urls: analysis.imageUrls!);
            }
            emit(AddAnalysisFailure(failure.errMessage));
          },
          (success) {
            emit(AddAnalysisSuccess());
          },
        );
      },
    );
  }
}
