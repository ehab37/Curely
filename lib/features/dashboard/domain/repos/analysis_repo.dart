import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnalysisRepo {
  Future<Either<Failure, void>> addAnalysis({required AnalysisEntity analysis});

  Future<Either<Failure, List<AnalysisEntity>>> getAnalysis({
    String? searchText,
  });

  Future<Either<Failure, List<AnalysisEntity>>> getFavoriteAnalysis();

  Future<Either<Failure, void>> deleteAnalysis({
    required AnalysisEntity analysis,
  });

  Future<Either<Failure, void>> updateAnalysis({
    required AnalysisEntity analysis,
  });
}
