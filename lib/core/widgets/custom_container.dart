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
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: border,
      ),
      child: child,
    );
  }
}
