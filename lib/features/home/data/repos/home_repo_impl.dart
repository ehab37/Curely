import 'dart:developer';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/services/url_services.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl({
    required this.urlServices,
    required this.firebaseAuthServices,
  });

  final UrlServices urlServices;
  final FirebaseAuthServices firebaseAuthServices;

  @override
  Future<void> callEmergency({required BuildContext context}) async {
    try {
      await urlServices.navigateToPhone(phoneNumber: "123");
    } catch (e) {
      log(e.toString());
      if (context.mounted) {
        InfoBox.customSnackBar(
          context,
          "Something went wrong, try again later",
        );
      }
    }
  }

  @override
  Future<Either<Failure, void>> logoutUser() async {
    try {
      await firebaseAuthServices.logoutUser();
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors("Something went wrong, try again later"),
      );
    }
  }
}
