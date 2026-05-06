import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsImageItem extends StatelessWidget {
  const DetailsImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRoutesConstants.kImageView, extra: imageUrl);
      },
      child: Hero(
        tag: imageUrl,
        child: CustomCachedImage(url: imageUrl),
      ),
    );
  }
}
