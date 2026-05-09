import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardCircle extends StatelessWidget {
  const CardCircle({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final FaIconData icon;
  final String text;
  final void Function() onPressed;

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
              icon: FaIcon(
                icon,
                size: 27,
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
