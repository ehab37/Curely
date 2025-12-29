import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/constants.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/features/dashboard/data/models/rays_model.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:dartz/dartz.dart';

class RaysRepoImpl implements RaysRepo {
  RaysRepoImpl({required this.databaseService});

  final DatabaseService databaseService;

  @override
  Future<Either<Failure, void>> addRays({
    required RaysEntity rays,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      await databaseService.addData(
        path: DatabaseKeys.users,
        data: RaysModel.fromEntity(rays).toMap(),
        docId: userId,
        subCollectionPath: DatabaseKeys.raysPath,
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
  Future<Either<Failure, List<RaysEntity>>> getRays() async {
    var userId = getFinalUserData().uId;
    try {
      var data =
      await databaseService.getData(
        path: DatabaseKeys.users,
        docId: userId,
        subCollectionPath: DatabaseKeys.raysPath,
      )
      as List<Map<String, dynamic>>;
      List<RaysEntity> rays = data
          .map((e) => RaysModel.fromJson(e).toEntity())
          .toList();
      return Right(rays);
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteRays({
    required String docId,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      await databaseService.deleteData(
        path: DatabaseKeys.users,
        docId: userId,
        subCollectionPath: DatabaseKeys.raysPath,
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
