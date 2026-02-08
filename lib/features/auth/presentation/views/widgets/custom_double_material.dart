import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDoubleMaterial extends StatelessWidget {
  const CustomDoubleMaterial({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Material(
        color: AppColors.background,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Material(
            color: AppColors.background,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(SpacingConstants.horizontalPadding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
