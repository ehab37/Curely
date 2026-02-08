import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/dashboard/data/models/analysis_model.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:dartz/dartz.dart';

class AnalysisRepoImpl implements AnalysisRepo {
  AnalysisRepoImpl({
    required this.databaseService,
    required this.networkManager,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;

  @override
  Future<Either<Failure, void>> addAnalysis({
    required AnalysisEntity analysis,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.addData(
        path: DatabaseConstants.users,
        data: AnalysisModel.fromEntity(analysis).toMap(),
        docId: userId,
        subCollectionPath: DatabaseConstants.analysisPath,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
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
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: userId,
                subCollectionPath: DatabaseConstants.analysisPath,
              )
              as List<Map<String, dynamic>>;
      List<AnalysisEntity> analysis = data
          .map((e) => AnalysisModel.fromJson(e).toEntity())
          .toList();
      return Right(analysis);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
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
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: userId,
        subCollectionPath: DatabaseConstants.analysisPath,
        subDocId: docId,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }
}
