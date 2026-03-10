import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'custom_back_bar.dart';

AppBar buildCustomAppBar({
  required String title,
  IconData? icon,
  bool isBackable = false,
}) {
  return AppBar(
    leading: isBackable ? CustomBackBar() : null,
    title: Text(title, style: Styles.styleBlue25),
    actions: [
      ?icon != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(icon, color: AppColors.primary),
            )
          : null,
    ],
  );
}
