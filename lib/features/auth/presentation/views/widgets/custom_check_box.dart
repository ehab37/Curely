import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 22,
        height: 22,
        duration: Duration(milliseconds: 400),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primary : AppColors.background,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? AppColors.transparent : AppColors.lightGray,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(AssetsConstants.kCheck),
              )
            : const SizedBox(),
      ),
    );
  }
}
