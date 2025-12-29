import 'package:curely/core/error/failures.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RaysRepo {
  Future<Either<Failure, void>> addRays({required RaysEntity rays});
  Future<Either<Failure, List<RaysEntity>>> getRays();
  Future<Either<Failure, void>> deleteRays({required String docId});
}
