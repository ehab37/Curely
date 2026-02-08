import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/dashboard/data/models/prescription_model.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:dartz/dartz.dart';

class PrescriptionRepoImpl implements PrescriptionRepo {
  PrescriptionRepoImpl({
    required this.databaseService,
    required this.networkManager,
    required this.userDataRepo,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;
  final UserDataRepo userDataRepo;

  UserEntity get user => userDataRepo.getUserDataLocally();

  @override
  Future<Either<Failure, void>> addPrescription({
    required PrescriptionEntity prescription,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.addData(
        path: DatabaseConstants.users,
        data: PrescriptionModel.fromEntity(prescription).toMap(),
        docId: user.uId,
        subCollectionPath: DatabaseConstants.prescriptionPath,
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
  Future<Either<Failure, List<PrescriptionEntity>>> getPrescriptions() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.prescriptionPath,
              )
              as List<Map<String, dynamic>>;
      List<PrescriptionEntity> prescriptions = data
          .map((e) => PrescriptionModel.fromJson(e).toEntity())
          .toList();
      return Right(prescriptions);
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
  Future<Either<Failure, void>> deletePrescription({
    required String docId,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: user.uId,
        subCollectionPath: DatabaseConstants.prescriptionPath,
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
