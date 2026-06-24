import 'dart:developer';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/presentation/cubits/download_image_cubit/download_image_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadImageCubit(imagesRepo: getIt<ImagesRepo>()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocConsumer<DownloadImageCubit, DownloadImageState>(
              listener: (context, state) {
                if (state is DownloadImageSuccess) {
                  InfoBox.successFloatingBox(context, "image_downloaded".tr());
                } else if (state is DownloadImageFailure) {
                  log(state.errMessage);
                  InfoBox.errorFloatingBox(
                    context,
                    "download_image_error".tr(),
                  );
                }
              },
              builder: (context, state) {
                return IconButton(
                  onPressed:
                      state is! DownloadImageLoading &&
                          state is! DownloadImageSuccess
                      ? () async {
                          await context
                              .read<DownloadImageCubit>()
                              .downloadImage(imageUrl: imageUrl);
                        }
                      : null,
                  icon: state is DownloadImageLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CustomLoadingIndicator(),
                        )
                      : Icon(
                          Icons.download_outlined,
                          color: state is DownloadImageSuccess
                              ? AppColors.unActive
                              : null,
                        ),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Hero(
                tag: imageUrl,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.4,
                  child: CustomCachedImage(url: imageUrl),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
