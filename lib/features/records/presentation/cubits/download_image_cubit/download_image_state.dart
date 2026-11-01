part of 'download_image_cubit.dart';

@immutable
sealed class DownloadImageState {}

final class DownloadImageInitial extends DownloadImageState {}

final class DownloadImageLoading extends DownloadImageState {}

final class DownloadImageSuccess extends DownloadImageState {}

final class DownloadImageFailure extends DownloadImageState {
  final String errMessage;

  DownloadImageFailure({required this.errMessage});
}
