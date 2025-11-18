import 'dart:developer';

import 'package:geolocator/geolocator.dart';

Future<Position?> getCurrentUserLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are disabled. Show a message to the user.
    log('Location services are disabled.');
    return null;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could show a rationale.
      log('Location permissions are denied.');
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    log(
      'Location permissions are permanently denied; we cannot request permissions.',
    );
    return null;
  }
  try {
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 15),
      ),
    );
  } catch (e) {
    log('Error retrieving location: $e');
    return null;
  }
}
