import 'dart:developer';
import 'dart:io';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/file_downloader.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class ImagesRepoImpl implements ImagesRepo {
  const ImagesRepoImpl({
    required this.storageServices,
    required this.fileDownloader,
    required this.networkManager,
  });

  final StorageServices storageServices;
  final FileDownloader fileDownloader;
  final NetworkManager networkManager;

  @override
  Future<Either<Failure, String>> uploadImage({
    required File imageFile,
    required String path,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
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
      return Left(OtherErrors.fromOtherErrors("upload_image_error".tr()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadImages({
    required List<File> imageFiles,
    required String path,
  }) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
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
      return Left(OtherErrors.fromOtherErrors("upload_images_error".tr()));
    }
  }

  @override
  Future<Either<Failure, void>> downloadImage({required String url}) async {
    try {
      if (!await networkManager.isInternetAvailable()) {
        throw CustomException(message: "no_internet_connection".tr());
      }
      final fileBytes = await storageServices.downloadFile(url: url);
      await fileDownloader.downloadFile(fileBytes: fileBytes);
      return Right(null);
    } on CustomException catch (e) {
      return Left(OtherErrors.fromOtherErrors(e.message));
    } catch (e) {
      log(e.toString());
      return Left(OtherErrors.fromOtherErrors("download_image_error".tr()));
    }
  }
}
