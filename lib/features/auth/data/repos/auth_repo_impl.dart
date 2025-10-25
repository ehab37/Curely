import 'dart:developer';

import 'package:curely/constants.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/features/auth/data/models/user_model.dart';
import 'package:curely/features/auth/domain/entities/user_entity.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  const AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServices.createAccount(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        email: email,
        name: name,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthServices.loginUser(
        email: email,
        password: password,
      );
      UserEntity userEntity = await getUserData(uId: user.uid);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUserWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.loginWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await databaseService.checkIfDataExists(
        path: users,
        docId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity,);
      }
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: users,
      data: user.toMap(),
      docId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    Map<String, dynamic> data = await databaseService.getData(
      path: users,
      docId: uId,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await firebaseAuthServices.resetPassword(email: email);
      return Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }
}
