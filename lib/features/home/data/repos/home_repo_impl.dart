import 'dart:developer';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/services/location_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/core/services/url_service.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl({
    required this.urlService,
    required this.locationService,
    required this.networkManager,
  });

  final UrlService urlService;
  final LocationService locationService;
  final NetworkManager networkManager;

  @override
  Future<void> callEmergency() async {
    try {
      await urlService.navigateToPhone(phoneNumber: "123");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<Either<Failure, void>> nearestPharmacy() async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      await locationService.locationPermission();
      Position currentLocation = await locationService.getCurrentUserLocation();
      await urlService.navigateToNearestPharmacy(
        currentLocation: currentLocation,
      );
      return Right(null);
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }
}
