import 'dart:developer';

import 'package:curely/core/error/failures.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/features/auth/data/models/user_model.dart';
import 'package:curely/features/auth/domain/entities/user_entity.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  const AuthRepoImpl({required this.firebaseAuthServices});

  @override
  Future<Either<AuthExceptionHandler, UserEntity>> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthServices.createAccount(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      throw Left(OtherErrors.fromOtherErrors(e));
    }
  }

  @override
  Future<Either<AuthExceptionHandler, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthServices.loginUser(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      throw Left(OtherErrors.fromOtherErrors(e));
    }
  }

  @override
  Future<Either<AuthExceptionHandler, UserEntity>> loginUserWithGoogle() async {
    try {
      User user = await firebaseAuthServices.loginWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      throw Left(OtherErrors.fromOtherErrors(e));
    }
  }
}
