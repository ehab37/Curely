import 'package:curely/core/helpers/extensions.dart';
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
      margin: const EdgeInsets.all(8),
      alignment: AlignmentDirectional.center,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          16.horizontalSpacing,
          Icon(prefixIcon),
          16.horizontalSpacing,
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(icon: Icon(suffixIcon, size: 30), onPressed: onPressed),
        ],
      ),
    );
  }
}
