import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/dashboard/data/models/medicine_model.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class MedicineRepoImpl implements MedicineRepo {
  MedicineRepoImpl({
    required this.databaseService,
    required this.networkManager,
    required this.userDataRepo,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;
  final UserDataRepo userDataRepo;

  UserEntity get user => userDataRepo.getUserDataLocally();

  @override
  Future<Either<Failure, String>> addMedicine({
    required MedicineEntity medicine,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      String? docId = await databaseService.addData(
        path: DatabaseConstants.users,
        data: MedicineModel.fromEntity(medicine).toMap(),
        docId: user.uId,
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
  Future<Either<Failure, List<MedicineEntity>>> getMedicines({
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
                subCollectionPath: DatabaseConstants.medicinePath,
              )
              as List<Map<String, dynamic>>;
      if (searchText != null) {
        final query = searchText.toLowerCase().trim();
        data = data.where((element) {
          return element.toString().toLowerCase().contains(query);
        }).toList();
      }
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
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
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
  Future<Either<Failure, List<MedicineEntity>>> getFavoriteMedicines() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.medicinePath,
                query: {"field": "isFavorite", "value": true},
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
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: user.uId,
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

  @override
  Future<Either<Failure, void>> updateMedicine({
    required MedicineEntity medicine,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      await databaseService.updateData(
        path: DatabaseConstants.users,
        docId: user.uId,
        subCollectionPath: DatabaseConstants.medicinePath,
        subDocId: medicine.docId,
        data: MedicineModel.fromEntity(medicine).toMap(),
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
