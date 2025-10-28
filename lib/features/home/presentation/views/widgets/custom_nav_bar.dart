import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.text,
    required this.prefixIcon,
    required this.onPressed,
    required this.suffixIcon,
  });

  final IconData prefixIcon, suffixIcon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: AlignmentDirectional.center,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: kLightGrayColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(prefixIcon, color: kNavyColor),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: Styles.styleBlue20,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(suffixIcon, color: kNavyColor, size: 35),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
