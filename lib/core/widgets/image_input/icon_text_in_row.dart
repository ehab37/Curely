import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class IconTextInRow extends StatelessWidget {
  const IconTextInRow({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          10.horizontalSpacing,
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
