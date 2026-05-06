import 'package:curely/core/helpers/extensions.dart';
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
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest,
          child: Center(
            child: IconButton(
              icon: Icon(
                icon,
                size: size ?? 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
        6.verticalSpacing,
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
