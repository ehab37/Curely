import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/constants.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
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
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;

  @override
  Future<Either<Failure, void>> addPrescription({
    required PrescriptionEntity prescription,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.addData(
        path: DatabaseKeys.users,
        data: PrescriptionModel.fromEntity(prescription).toMap(),
        docId: userId,
        subCollectionPath: DatabaseKeys.prescriptionPath,
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
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseKeys.users,
                docId: userId,
                subCollectionPath: DatabaseKeys.prescriptionPath,
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
    var userId = getFinalUserData().uId;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.deleteData(
        path: DatabaseKeys.users,
        docId: userId,
        subCollectionPath: DatabaseKeys.prescriptionPath,
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
