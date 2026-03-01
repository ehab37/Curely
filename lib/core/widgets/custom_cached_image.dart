import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, this.height, required this.url});

  final double? height;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl: url,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
