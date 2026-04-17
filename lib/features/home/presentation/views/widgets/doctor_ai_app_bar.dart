import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

AppBar buildDoctorAiAppBar(BuildContext context) {
  final theme = CacheHelper.getData(key: AppTextConstants.kThemeKey);
  return AppBar(
    title: Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withAlpha(30),
          radius: 18,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(
              theme == AppTextConstants.dark
                  ? AssetsConstants.kLogoDark
                  : AssetsConstants.kLogo,
            ),
          ),
        ),
        10.horizontalSpacing,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("dr_curely"),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
                  context.tr("online"),
                  style: const TextStyle(fontSize: 12, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    elevation: 2,
  );
}
