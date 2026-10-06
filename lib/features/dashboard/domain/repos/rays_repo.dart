import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RaysRepo {
  Future<Either<Failure, void>> addRays({
    required RaysEntity rays,
    required String profileId,
  });

  Future<Either<Failure, List<RaysEntity>>> getRays({
    String? searchText,
    required String profileId,
  });

  Future<Either<Failure, List<RaysEntity>>> getFavoriteRays({
    required String profileId,
  });

  Future<Either<Failure, void>> deleteRays({
    required RaysEntity rays,
    required String profileId,
  });

  Future<Either<Failure, void>> updateRays({
    required RaysEntity rays,
    required String profileId,
  });
}
