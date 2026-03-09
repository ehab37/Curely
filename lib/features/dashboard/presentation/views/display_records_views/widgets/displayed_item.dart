import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
        side: BorderSide(color: AppColors.borderMedium),
      ),
      color: AppColors.background,
      elevation: 8,
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
              ? Icon(FontAwesomeIcons.pills, size: 80)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomCachedImage(height: 80, url: imageUrl!),
                ),
          Spacer(),
          Text(text1, style: Styles.styleBlue20),
          4.verticalSpacing,
          Text(text2, style: Styles.style16),
          4.verticalSpacing,
          Text(
            DateFormat("dd/MM/yyyy").format(DateTime.parse(text3)).toString(),
            style: Styles.style16,
          ),
          12.verticalSpacing,
        ],
      ),
    );
  }
}
