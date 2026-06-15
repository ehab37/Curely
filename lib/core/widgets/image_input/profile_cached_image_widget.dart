import 'package:cached_network_image/cached_network_image.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCachedImageWidget extends StatelessWidget {
  const ProfileCachedImageWidget({
    super.key,
    this.imageUrl,
    this.isProfile = true,
  });

  final String? imageUrl;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        isProfile ? appSize.height / 14.5 : 20,
      ),
      clipBehavior: Clip.hardEdge,
      child: CircleAvatar(
        radius: isProfile ? appSize.height / 14.5 : 20,
        backgroundColor: isProfile
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).primaryColor,
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholder: (context, url) => CustomLoadingIndicator(),
                errorWidget: (context, url, error) => Center(
                  child: FaIcon(
                    FontAwesomeIcons.circleUser,
                    size: isProfile ? appSize.height / 8.5 : 35,
                    color: isProfile
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            : Center(
                child: FaIcon(
                  FontAwesomeIcons.circleUser,
                  size: isProfile ? appSize.height / 8.5 : 35,
                  color: isProfile
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}
