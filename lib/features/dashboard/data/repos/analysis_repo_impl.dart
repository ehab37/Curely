import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/constants.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/features/dashboard/data/models/analysis_model.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:dartz/dartz.dart';

class AnalysisRepoImpl implements AnalysisRepo {
  AnalysisRepoImpl({required this.databaseService});

  final DatabaseService databaseService;

  @override
  Future<Either<Failure, void>> addAnalysis({
    required AnalysisEntity analysis,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      await databaseService.addData(
        path: DatabaseKeys.users,
        data: AnalysisModel.fromEntity(analysis).toMap(),
        docId: userId,
        subCollectionPath: DatabaseKeys.analysisPath,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, List<AnalysisEntity>>> getAnalysis() async {
    var userId = getFinalUserData().uId;
    try {
      var data =
          await databaseService.getData(
                path: DatabaseKeys.users,
                docId: userId,
                subCollectionPath: DatabaseKeys.analysisPath,
              )
              as List<Map<String, dynamic>>;
      List<AnalysisEntity> analysis = data
          .map((e) => AnalysisModel.fromJson(e).toEntity())
          .toList();
      return Right(analysis);
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteAnalysis({required String docId}) async {
    var userId = getFinalUserData().uId;
    try {
      await databaseService.deleteData(
        path: DatabaseKeys.users,
        docId: userId,
        subCollectionPath: DatabaseKeys.analysisPath,
        subDocId: docId,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }
}
