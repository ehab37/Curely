import 'package:curely/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<void> callEmergency();

  Future<Either<Failure, void>> nearestPharmacy();
}
