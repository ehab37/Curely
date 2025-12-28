import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/constants.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/features/dashboard/data/models/medicine_model.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:dartz/dartz.dart';

class MedicineRepoImpl implements MedicineRepo {
  MedicineRepoImpl({required this.databaseService});

  final DatabaseService databaseService;

  @override
  Future<Either<Failure, void>> addMedicine({
    required MedicineEntity medicine,
  }) async {
    var userId = getFinalUserData().uId;
    try {
      await databaseService.addData(
        path: DatabaseKeys.users,
        data: MedicineModel.fromEntity(medicine).toMap(),
        docId: userId,
        subCollectionPath: DatabaseKeys.medicinePath,
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
  Future<Either<Failure, List<MedicineEntity>>> getMedicines() async {
    var userId = getFinalUserData().uId;
    try {
      var data =
          await databaseService.getData(
                path: DatabaseKeys.users,
                docId: userId,
                subCollectionPath: DatabaseKeys.medicinePath,
              )
              as List<Map<String, dynamic>>;
      List<MedicineEntity> medicines = data
          .map((e) => MedicineModel.fromJson(e).toEntity())
          .toList();
      return Right(medicines);
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
      await databaseService.deleteData(
        path: DatabaseKeys.users,
        docId: userId,
        subCollectionPath: DatabaseKeys.medicinePath,
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
