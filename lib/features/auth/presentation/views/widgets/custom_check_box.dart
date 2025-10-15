import 'package:curely/constants.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChecked});
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
        duration: kTransitionDuration,
        decoration: ShapeDecoration(
          color: isChecked ? kNavyColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : kLightGrayColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Padding(
          padding: const EdgeInsets.all(2),
          child: SvgPicture.asset(
            AssetsData.kCheck,
          ),
        )
            : const SizedBox(),
      ),
    );
  }
}