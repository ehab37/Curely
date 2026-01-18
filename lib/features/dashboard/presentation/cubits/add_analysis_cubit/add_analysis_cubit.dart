import 'package:curely/constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_analysis_state.dart';

class AddAnalysisCubit extends Cubit<AddAnalysisState> {
  AddAnalysisCubit({required this.imagesRepo, required this.analysisRepo})
    : super(AddAnalysisInitial());
  final ImagesRepo imagesRepo;
  final AnalysisRepo analysisRepo;

  Future<void> addAnalysis({required AnalysisEntity analysis}) async {
    emit(AddAnalysisLoading());
    var result = await imagesRepo.uploadImages(
      imageFiles: analysis.images!,
      path: '${DatabaseKeys.imagesPath}/${DatabaseKeys.analysisPath}',
    );
    result.fold(
      (failure) {
        emit(UploadImageFailure(failure.errMessage));
      },
      (urls) async {
        analysis.imageUrls = urls;
        var result2 = await analysisRepo.addAnalysis(analysis: analysis);
        result2.fold(
          (failure) {
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
