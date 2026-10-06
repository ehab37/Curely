import 'package:curely/core/error/failures.dart';
import 'package:curely/features/profile/domain/entities/dependent_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DependentsRepo {
  Future<Either<Failure, String>> addDependent({
    required DependentEntity dependent,
  });

  Future<Either<Failure, List<DependentEntity>>> getDependents();

  Future<Either<Failure, void>> updateDependent({
    required DependentEntity dependent,
  });

  Future<Either<Failure, void>> deleteDependent({
    required DependentEntity dependent,
  });
}
