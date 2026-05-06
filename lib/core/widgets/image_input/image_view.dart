import 'package:curely/core/services/file_downloader.dart';
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
            onPressed: !downloadDone
                ? () async {
                    downloadDone = await FileDownloader.downloadImage(
                      widget.image,
                    );
                    context.mounted
                        ? downloadDone
                              ? InfoBox.successFloatingBox(
                                  context,
                                  'Image downloaded successfully',
                                )
                              : InfoBox.errorFloatingBox(
                                  context,
                                  'An error occurred while downloading the image!',
                                )
                        : null;
                    setState(() {});
                  }
                : null,
            icon: downloadDone
                ? Icon(Icons.download_outlined, color: AppColors.unActive)
                : Icon(Icons.download_outlined),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Hero(
            tag: widget.image,
            child: Image.network(widget.image, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
