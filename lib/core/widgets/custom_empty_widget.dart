import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? icon;
  final VoidCallback? onActionPressed;

  const CustomEmptyWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.icon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.skyBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon ?? Icons.content_paste_search,
              size: 80,
              color: AppColors.primary,
            ),
          ),
          24.verticalSpacing,
          Text(title, style: Styles.styleBlue20, textAlign: TextAlign.center),
          12.verticalSpacing,
          Text(
            subTitle ?? '',
            style: Styles.style15,
            textAlign: TextAlign.center,
          ),
          32.verticalSpacing,
          if (onActionPressed != null)
            ElevatedButton.icon(
              onPressed: onActionPressed,
              icon: Icon(Icons.add, color: AppColors.primary),
              label: const Text("Add New Record", style: Styles.style16),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.skyBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
