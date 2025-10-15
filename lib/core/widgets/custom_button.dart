import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.child,
    required this.onPressed,
    super.key,
    required this.backgroundColor,
  });

  final void Function() onPressed;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(
            color: backgroundColor,
            width: 2,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(double.maxFinite, 50)),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: child,
    );
  }
}
