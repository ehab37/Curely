import 'package:curely/core/helpers/extensions.dart';
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
        CustomBackBar(horizontalPadding: 0),
        10.verticalSpacing,
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
