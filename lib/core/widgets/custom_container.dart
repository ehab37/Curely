import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.border,
    required this.child,
  });

  final BorderRadiusGeometry border;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.39,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: border,
      ),
      child: child,
    );
  }
}
