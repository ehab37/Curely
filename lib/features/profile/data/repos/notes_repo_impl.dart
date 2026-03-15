import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/profile/data/models/note_model.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/domain/repos/notes_repo.dart';
import 'package:dartz/dartz.dart';

class NotesRepoImpl implements NotesRepo {
  NotesRepoImpl({
    required this.databaseService,
    required this.networkManager,
    required this.userDataRepo,
  });

  final DatabaseService databaseService;
  final NetworkManager networkManager;
  final UserDataRepo userDataRepo;

  UserEntity get user => userDataRepo.getUserDataLocally();

  @override
  Future<Either<Failure, void>> addNote({required NoteEntity note}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.addData(
        path: DatabaseConstants.users,
        data: NoteModel.fromEntity(note).toMap(),
        docId: user.uId,
        subCollectionPath: DatabaseConstants.notesPath,
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
  Future<Either<Failure, List<NoteEntity>>> getNotes({
    String? searchText,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.notesPath,
              )
              as List<Map<String, dynamic>>;
      if (searchText != null) {
        final query = searchText.toLowerCase().trim();
        data = data.where((element) {
          return element.toString().toLowerCase().contains(query);
        }).toList();
      }
      List<NoteEntity> note = data
          .map((e) => NoteModel.fromJson(e).toEntity())
          .toList();
      return Right(note);
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
  Future<Either<Failure, List<NoteEntity>>> getFavoriteNotes() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      var data =
          await databaseService.getData(
                path: DatabaseConstants.users,
                docId: user.uId,
                subCollectionPath: DatabaseConstants.notesPath,
                query: {"field": "isFavorite", "value": true},
              )
              as List<Map<String, dynamic>>;
      List<NoteEntity> note = data
          .map((e) => NoteModel.fromJson(e).toEntity())
          .toList();
      return Right(note);
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
  Future<Either<Failure, void>> deleteNote({required String docId}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.deleteData(
        path: DatabaseConstants.users,
        docId: user.uId,
        subCollectionPath: DatabaseConstants.notesPath,
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
  Future<Either<Failure, void>> updateNote({required NoteEntity note}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await databaseService.updateData(
        path: DatabaseConstants.users,
        docId: user.uId,
        subCollectionPath: DatabaseConstants.notesPath,
        subDocId: note.docId,
        data: NoteModel.fromEntity(note).toMap(),
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
