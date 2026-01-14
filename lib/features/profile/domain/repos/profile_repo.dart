import 'package:curely/core/error/failures.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> editUserData({required UserEntity user});
}
