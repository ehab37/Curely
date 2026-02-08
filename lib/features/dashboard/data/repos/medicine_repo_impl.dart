import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/dashboard/data/models/medicine_model.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:dartz/dartz.dart';

class MedicineRepoImpl implements MedicineRepo {
  MedicineRepoImpl({
    required this.databaseService,
    required this.networkManager,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;

  @override
  Future<Either<Failure, String>> addMedicine({
    required MedicineEntity medicine,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      String? docId = await databaseService.addData(
        path: DatabaseConstants.users,
        data: MedicineModel.fromEntity(medicine).toMap(),
        docId: userId,
        subCollectionPath: DatabaseConstants.medicinePath,
      );
      return Right(docId!);
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
  Future<Either<Failure, List<MedicineEntity>>> getMedicines() async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: userId,
                subCollectionPath: DatabaseConstants.medicinePath,
              )
              as List<Map<String, dynamic>>;
      List<MedicineEntity> medicines = data
          .map((e) => MedicineModel.fromJson(e).toEntity())
          .toList();
      return Right(medicines);
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
  Future<Either<Failure, List<MedicineEntity>>> getReminderMedicines() async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: userId,
                subCollectionPath: DatabaseConstants.medicinePath,
                query: {"field": "isReminderActive", "value": true},
              )
              as List<Map<String, dynamic>>;
      List<MedicineEntity> medicines = data
          .map((e) => MedicineModel.fromJson(e).toEntity())
          .toList();
      return Right(medicines);
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
  Future<Either<Failure, void>> deleteMedicine({required String docId}) async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: userId,
        subCollectionPath: DatabaseConstants.medicinePath,
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
