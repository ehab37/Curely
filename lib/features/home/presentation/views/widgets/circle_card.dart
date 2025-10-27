import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CardCircle extends StatelessWidget {
  const CardCircle({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.size,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: kLightGrayColor,
          child: Center(
            child: IconButton(
              icon: Icon(icon, size: size ?? 30, color: kNavyColor),
              onPressed: onPressed,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: Styles.style18.copyWith(
            color: kNavyColor,
          ),
        ),
      ],
    );
  }
}
