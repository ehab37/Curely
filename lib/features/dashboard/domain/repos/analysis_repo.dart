import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnalysisRepo {
  Future<Either<Failure, void>> addAnalysis({
    required AnalysisEntity analysis,
    required String profileId,
  });

  Future<Either<Failure, List<AnalysisEntity>>> getAnalysis({
    String? searchText,
    required String profileId,
  });

  Future<Either<Failure, List<AnalysisEntity>>> getFavoriteAnalysis({
    required String profileId,
  });

  Future<Either<Failure, void>> deleteAnalysis({
    required AnalysisEntity analysis,
    required String profileId,
  });

  Future<Either<Failure, void>> updateAnalysis({
    required AnalysisEntity analysis,
    required String profileId,
  });
}
