import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'custom_back_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        8.verticalSpacing,
        Row(
          children: [
            CustomBackBar(),
            Expanded(
              child: Text(
                title,
                style: Styles.style33,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        8.verticalSpacing,
      ],
    );
  }
}
