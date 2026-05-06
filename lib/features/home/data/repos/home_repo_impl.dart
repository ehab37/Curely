import 'dart:developer';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/services/ai_chat_service.dart';
import 'package:curely/core/services/location_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/core/services/url_service.dart';
import 'package:curely/features/home/domain/entities/chat_message.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl({
    required this.urlService,
    required this.locationService,
    required this.geminiChatService,
    required this.networkManager,
  });

  final UrlService urlService;
  final LocationService locationService;
  final AiChatService geminiChatService;
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
        throw CustomException(message: "no_internet_connection".tr());
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

  @override
  Future<Either<Failure, String>> sendPromptToAi({
    required String prompt,
    List<ChatMessage>? messagesHistory,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      final response = await geminiChatService.sendPrompt(
        prompt: prompt,
        messagesHistory: messagesHistory,
      );
      if (response == null) {
        throw CustomException(message: "Failed to get response from Gemini");
      }
      return Right(response);
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }
}
