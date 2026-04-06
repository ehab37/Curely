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
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(text2, style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest.withAlpha(50),
            ),
          ),
          icon: Icon(icon),
        ),
      ],
    );
  }
}
