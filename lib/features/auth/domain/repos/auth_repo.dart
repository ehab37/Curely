import 'package:curely/core/error/failures.dart';
import 'package:curely/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createAccount({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> loginUserWithGoogle();

  Future<Either<Failure, void>> resetPassword({required String email});
}
