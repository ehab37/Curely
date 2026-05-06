import 'package:cached_network_image/cached_network_image.dart';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
        );
      },
      imageUrl: url,
      placeholder: (context, url) => Skeletonizer.zone(
        child: Bone.square(
          borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
