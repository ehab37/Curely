import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.text,
    required this.prefixIcon,
    required this.onPressed,
    required this.suffixIcon,
  });

  final IconData prefixIcon, suffixIcon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: AlignmentDirectional.center,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          16.horizontalSpacing,
          Icon(prefixIcon, color: AppColors.primary),
          16.horizontalSpacing,
          Expanded(
            child: Text(
              text,
              style: Styles.styleBlue20,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(suffixIcon, color: AppColors.primary, size: 35),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
