import 'package:curely/core/services/file_downloader.dart';
import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key, required this.image});

  final String image;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  bool downloadDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: downloadDone
                ? () {
                    setState(() async {
                      downloadDone = await FileDownloader.downloadImage(
                        widget.image,
                      );
                      context.mounted
                          ? InfoBox.customSnackBar(
                              context,
                              downloadDone
                                  ? 'Image downloaded successfully'
                                  : 'An error occurred while downloading the image!',
                            )
                          : null;
                    });
                  }
                : null,
            icon: downloadDone
                ? Icon(Icons.download_outlined, color: AppColors.unActive)
                : Icon(Icons.download_outlined, color: AppColors.primary),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Hero(
          tag: AppTextConstants.imageTag,
          child: Image.network(widget.image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
