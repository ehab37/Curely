import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/profile/data/models/dependent_model.dart';
import 'package:curely/features/profile/domain/entities/dependent_entity.dart';
import 'package:curely/features/profile/domain/repos/dependents_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class DependentsRepoImpl implements DependentsRepo {
  DependentsRepoImpl({
    required this.databaseService,
    required this.networkManager,
    required this.userDataRepo,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;
  final UserDataRepo userDataRepo;

  UserEntity get user => userDataRepo.getUserDataLocally();

  @override
  Future<Either<Failure, String>> addDependent({
    required DependentEntity dependent,
    required int dependentsNumber,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      if (dependentsNumber > 8) {
        throw CustomException(message: "max_dependents_reached".tr());
      }
      String? docId = await databaseService.addData(
        path: DatabaseConstants.users,
        data: DependentModel.fromEntity(dependent).toMap(),
        docId: user.uId,
        subCollectionPath: DatabaseConstants.dependents,
      );
      if (docId != null) {
        await databaseService.updateData(
          path: DatabaseConstants.users,
          docId: user.uId,
          subCollectionPath: DatabaseConstants.dependents,
          subDocId: docId,
          data: {DatabaseConstants.uId: docId},
        );
      }
      return Right(docId!);
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
  Future<Either<Failure, List<DependentEntity>>> getDependents() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.dependents,
              )
              as List<Map<String, dynamic>>;

      List<DependentEntity> dependents = data
          .map((e) => DependentModel.fromJson(e))
          .toList();
      return Right(dependents);
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
  Future<Either<Failure, void>> updateDependent({
    required DependentEntity dependent,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.updateData(
        path: DatabaseConstants.users,
        docId: user.uId,
        data: DependentModel.fromEntity(dependent).toMap(),
        subCollectionPath: DatabaseConstants.dependents,
        subDocId: dependent.docId!,
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
  Future<Either<Failure, void>> deleteDependent({
    required DependentEntity dependent,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: user.uId,
        subDocId: dependent.docId!,
        subCollectionPath: DatabaseConstants.dependents,
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
