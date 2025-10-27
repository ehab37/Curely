import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
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
        SizedBox(height: 30),
        Text(title, style: Styles.styleBlue25),
        Text(
          subTitle,
          style: Styles.style18.copyWith(color: kNavyColor.withAlpha(160)),
        ),
      ],
    );
  }
}
