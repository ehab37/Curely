import 'package:cached_network_image/cached_network_image.dart';
import 'package:curely/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            placeholder: (context, url) =>
                CircularProgressIndicator(color: kNavyColor),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
        : const Center(
            child: Icon(
              FontAwesomeIcons.circleUser,
              size: 105,
              color: kBlueColor,
            ),
          );
  }
}
