import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class CardCircle extends StatelessWidget {
  const CardCircle({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.size,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.lightGray,
          child: Center(
            child: IconButton(
              icon: Icon(icon, size: size ?? 30, color: AppColors.primary),
              onPressed: onPressed,
            ),
          ),
        ),
        6.verticalSpacing,
        Text(text, style: Styles.style18.copyWith(color: AppColors.primary)),
      ],
    );
  }
}
