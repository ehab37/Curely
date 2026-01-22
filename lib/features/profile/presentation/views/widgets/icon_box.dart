import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: kSkyBlueColor,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Icon(icon, color: kNavyColor),
    );
  }
}
