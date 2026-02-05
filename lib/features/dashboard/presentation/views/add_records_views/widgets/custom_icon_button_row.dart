import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomIconButtonRow extends StatelessWidget {
  const CustomIconButtonRow({
    super.key,
    required this.text1,
    required this.text2,
    required this.icon,
    required this.onPressed,
  });

  final String text1;
  final String text2;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.25,
          child: Text(
            text1,
            style: Styles.style16,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(text2, style: Styles.style16),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(kOffWhiteColor),
          ),
          icon: Icon(icon, color: kNavyColor),
        ),
      ],
    );
  }
}
