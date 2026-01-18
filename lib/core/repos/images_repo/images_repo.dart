import 'dart:io';
import 'package:curely/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage({
    required File imageFile,
    required String path,
  });

  Future<Either<Failure, List<String>>> uploadImages({
    required List<File> imageFiles,
    required String path,
  });
}
