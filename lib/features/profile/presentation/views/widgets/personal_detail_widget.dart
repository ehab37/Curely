import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:curely/features/profile/presentation/views/widgets/icon_box.dart';
import 'package:flutter/material.dart';

class PersonalDetailWidget extends StatelessWidget {
  const PersonalDetailWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          color: AppColors.skyBlue.withAlpha(100),
          borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
        ),
        child: Row(
          children: [
            IconBox(icon: icon),
            12.horizontalSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.style18.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  style: Styles.style15.copyWith(color: AppColors.background),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
