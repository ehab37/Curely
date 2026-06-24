import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'download_image_state.dart';

class DownloadImageCubit extends Cubit<DownloadImageState> {
  DownloadImageCubit({required this.imagesRepo})
    : super(DownloadImageInitial());
  final ImagesRepo imagesRepo;

  Future<void> downloadImage({required String imageUrl}) async {
    emit(DownloadImageLoading());
    var result = await imagesRepo.downloadImage(url: imageUrl);
    result.fold(
      (failure) {
        emit(DownloadImageFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(DownloadImageSuccess());
      },
    );
  }
}
