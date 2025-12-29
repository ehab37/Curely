import 'package:curely/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class HomeRepo {
  Future callEmergency({required BuildContext context});
  Future<Either<Failure, void>> logoutUser();
}