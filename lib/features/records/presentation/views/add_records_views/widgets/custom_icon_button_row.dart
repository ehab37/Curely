import 'package:curely/core/helpers/extensions.dart';
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
        Expanded(
          flex: 10,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(text1, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ),
        8.horizontalSpacing,
        Text(text2, style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          icon: Icon(icon),
        ),
      ],
    );
  }
}
