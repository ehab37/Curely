import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackBar extends StatelessWidget {
  const CustomBackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
