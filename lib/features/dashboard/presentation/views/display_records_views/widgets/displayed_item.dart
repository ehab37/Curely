import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_fav_icon.dart';

class DisplayedItem extends StatelessWidget {
  const DisplayedItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    this.imageUrl,
    this.isFavorite = false,
    this.onTap,
  });

  final String? imageUrl;
  final String text1, text2, text3;
  final bool isFavorite;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(
          SpacingConstants.borderRadius,
        ),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: GestureDetector(
                onTap: onTap,
                child: CustomFavIcon(isFav: isFavorite),
              ),
            ),
            imageUrl == null
                ? Expanded(child: Icon(FontAwesomeIcons.pills, size: 60))
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CustomCachedImage(url: imageUrl!),
                    ),
                  ),
            8.verticalSpacing,
            Text(text1, style: Theme.of(context).textTheme.titleSmall),
            4.verticalSpacing,
            FittedBox(
              child: Text(text2, style: Theme.of(context).textTheme.bodyMedium),
            ),
            4.verticalSpacing,
            Text(
              DateFormat("dd/MM/yyyy").format(DateTime.parse(text3)).toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            12.verticalSpacing,
          ],
        ),
      ),
    );
  }
}
