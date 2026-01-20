import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.border,
    required this.child,
    this.height,
  });

  final BorderRadiusGeometry border;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? MediaQuery.of(context).size.height * 0.39,
      decoration: BoxDecoration(color: kNavyColor, borderRadius: border),
      child: child,
    );
  }
}
