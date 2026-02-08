import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/dashboard/data/models/rays_model.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:dartz/dartz.dart';

class RaysRepoImpl implements RaysRepo {
  RaysRepoImpl({required this.databaseService, required this.networkManager});

  final DatabaseService databaseService;
  final NetworkManager networkManager;

  @override
  Future<Either<Failure, void>> addRays({required RaysEntity rays}) async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.addData(
        path: DatabaseConstants.users,
        data: RaysModel.fromEntity(rays).toMap(),
        docId: userId,
        subCollectionPath: DatabaseConstants.raysPath,
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
  Future<Either<Failure, List<RaysEntity>>> getRays() async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: userId,
                subCollectionPath: DatabaseConstants.raysPath,
              )
              as List<Map<String, dynamic>>;
      List<RaysEntity> rays = data
          .map((e) => RaysModel.fromJson(e).toEntity())
          .toList();
      return Right(rays);
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
  Future<Either<Failure, void>> deleteRays({required String docId}) async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: userId,
        subCollectionPath: DatabaseConstants.raysPath,
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
