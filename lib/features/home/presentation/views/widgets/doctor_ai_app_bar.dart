import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';

AppBar buildDoctorAiAppBar() {
  return AppBar(
    title: Row(
      children: [
        CircleAvatar(
          radius: 18,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(AssetsConstants.kLogo),
          ),
        ),
        10.horizontalSpacing,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dr. Curely', style: Styles.style16),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                4.horizontalSpacing,
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    backgroundColor: AppColors.white,
    elevation: 1,
  );
}
