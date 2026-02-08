import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'custom_back_bar.dart';

class TitleSubTitleBack extends StatelessWidget {
  const TitleSubTitleBack({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackBar(),
        30.verticalSpacing,
        Text(title, style: Styles.styleBlue25),
        Text(
          subTitle,
          style: Styles.style18.copyWith(
            color: AppColors.primary.withAlpha(160),
          ),
        ),
      ],
    );
  }
}
