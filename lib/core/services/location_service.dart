import 'package:curely/core/error/exceptions.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<bool> isLocationEnabled() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    return serviceEnabled;
  }

  Future<void> locationPermission() async {
    LocationPermission permission;

    if (!await isLocationEnabled()) {
      throw CustomException(message: 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw CustomException(message: 'Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw CustomException(
        message:
            'Location permissions are permanently denied; we cannot request permissions.',
      );
    }
  }

  Future<Position> getCurrentUserLocation() {
    return Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 15),
      ),
    );
  }
}
