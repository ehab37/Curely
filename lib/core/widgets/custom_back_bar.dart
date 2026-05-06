import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackBar extends StatelessWidget {
  const CustomBackBar({super.key, this.horizontalPadding});

  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 16.0),
          child: Icon(Icons.arrow_back_ios_new_outlined, size: 30),
        ),
      ),
    );
  }
}
