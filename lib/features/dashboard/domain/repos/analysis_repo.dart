import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnalysisRepo {
  Future<Either<Failure, void>> addAnalysis({required AnalysisEntity analysis});
  Future<Either<Failure, List<AnalysisEntity>>> getAnalysis();
  Future<Either<Failure, void>> deleteAnalysis({required String docId});
}
