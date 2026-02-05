import 'dart:developer';
import 'dart:io';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:dartz/dartz.dart';

class ImagesRepoImpl implements ImagesRepo {
  const ImagesRepoImpl({
    required this.storageServices,
    required this.networkManager,
  });

  final StorageServices storageServices;
  final NetworkManager networkManager;

  @override
  Future<Either<Failure, String>> uploadImage({
    required File imageFile,
    required String path,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      String url = await storageServices.uploadFile(
        file: imageFile,
        path: path,
      );
      return Right(url);
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors(
          "Something went wrong while uploading image, try again later.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadImages({
    required List<File> imageFiles,
    required String path,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "No Internet Connection");
      }
      List<String> urls = await storageServices.uploadFiles(
        files: imageFiles,
        path: path,
      );
      return Right(urls);
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(
        OtherErrors.fromOtherErrors(
          "Something went wrong while uploading images, try again later.",
        ),
      );
    }
  }
}
