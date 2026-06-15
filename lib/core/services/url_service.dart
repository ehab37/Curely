import 'package:curely/core/error/exceptions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> navigateToPhone({required String phoneNumber}) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw CustomException(message: 'Could not launch $url');
    }
  }

  Future<void> navigateToNearestPharmacy({
    required Position currentLocation,
  }) async {
    final String searchTerm = 'nearest pharmacy';
    final double lat = currentLocation.latitude;
    final double lng = currentLocation.longitude;
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/$searchTerm/@$lat,$lng',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw CustomException(
        message: 'Could not launch the Maps application for URL: $url',
      );
    }
  }

  Future<void> navigateToGmail() async {
    final Uri url = Uri.parse('https://mail.google.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw CustomException(message: 'Could not launch $url');
    }
  }
}
