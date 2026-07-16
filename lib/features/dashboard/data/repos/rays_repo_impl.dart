import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/dashboard/data/models/rays_model.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class RaysRepoImpl implements RaysRepo {
  RaysRepoImpl({
    required this.databaseService,
    required this.networkManager,
    required this.userDataRepo,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;
  final UserDataRepo userDataRepo;

  UserEntity get user => userDataRepo.getUserDataLocally();

  @override
  Future<Either<Failure, void>> addRays({required RaysEntity rays}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.addData(
        path: DatabaseConstants.users,
        data: RaysModel.fromEntity(rays).toMap(),
        docId: user.uId,
        subCollectionPath: DatabaseConstants.raysPath,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors("something_went_wrong".tr()));
    }
  }

  @override
  Future<Either<Failure, List<RaysEntity>>> getRays({
    String? searchText,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.raysPath,
              )
              as List<Map<String, dynamic>>;
      if (searchText != null) {
        final query = searchText.toLowerCase().trim();
        data = data.where((element) {
          return element.toString().toLowerCase().contains(query);
        }).toList();
      }
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
      return Left(OtherErrors.fromOtherErrors("something_went_wrong".tr()));
    }
  }

  @override
  Future<Either<Failure, List<RaysEntity>>> getFavoriteRays() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.raysPath,
                query: {"field": "isFavorite", "value": true},
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
      return Left(OtherErrors.fromOtherErrors("something_went_wrong".tr()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRays({required String docId}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: user.uId,
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
      return Left(OtherErrors.fromOtherErrors("something_went_wrong".tr()));
    }
  }

  @override
  Future<Either<Failure, void>> updateRays({required RaysEntity rays}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.updateData(
        path: DatabaseConstants.users,
        docId: user.uId,
        subCollectionPath: DatabaseConstants.raysPath,
        subDocId: rays.docId,
        data: RaysModel.fromEntity(rays).toMap(),
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors("something_went_wrong".tr()));
    }
  }
}
