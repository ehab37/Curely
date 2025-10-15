import 'package:curely/core/error/failures.dart';
import 'package:curely/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<AuthExceptionHandler, UserEntity>> createAccount({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<AuthExceptionHandler, UserEntity>> loginUser({
    required String email,
    required String password,
  });
}
