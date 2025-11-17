import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custom_back_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Row(
          children: [
            CustomBackBar(),
            Text(title, style: Styles.style33),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
