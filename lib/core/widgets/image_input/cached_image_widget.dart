import 'package:cached_network_image/cached_network_image.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({super.key, this.imageUrl, this.isProfile = true});

  final String? imageUrl;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isProfile ? 60 : 20),
      clipBehavior: Clip.hardEdge,
      child: CircleAvatar(
        radius: isProfile ? 60 : 20,
        backgroundColor: isProfile ? AppColors.background : AppColors.primary,
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColors.primary),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Center(
                child: Icon(
                  FontAwesomeIcons.circleUser,
                  size: isProfile ? 105 : 35,
                  color: isProfile ? AppColors.primary : AppColors.background,
                ),
              ),
      ),
    );
  }
}
