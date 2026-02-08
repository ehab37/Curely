import 'dart:developer';
import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/models/user_model.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final UserDataRepo userDataRepo;
  final NetworkManager networkManager;

  const AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.userDataRepo,
    required this.networkManager,
  });

  @override
  Future<Either<Failure, UserEntity>> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      user = await firebaseAuthServices.createAccount(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        email: email,
        name: name,
        uId: user.uid,
      );
      await userDataRepo.addUserData(user: userEntity);
      await userDataRepo.saveUserData(user: userEntity);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      User user = await firebaseAuthServices.loginUser(
        email: email,
        password: password,
      );
      UserEntity userEntity = await userDataRepo.getUserData(uId: user.uid);
      await userDataRepo.saveUserData(user: userEntity);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
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
  Future<Either<Failure, UserEntity>> loginUserWithGoogle() async {
    User? user;
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      user = await firebaseAuthServices.loginWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await userDataRepo.checkIfDataExists(docId: user.uid);
      if (isUserExist) {
        userEntity = await userDataRepo.getUserData(uId: user.uid);
      } else {
        await userDataRepo.addUserData(user: userEntity);
      }
      await userDataRepo.saveUserData(user: userEntity);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await firebaseAuthServices.resetPassword(email: email);
      return Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
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
  Future<Either<Failure, void>> logoutUser() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await firebaseAuthServices.logoutUser();
      await CacheHelper.removeData(key: CacheConstants.user);
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors(
          "Something wrong happened, please try again later.",
        ),
      );
    }
  }
}
