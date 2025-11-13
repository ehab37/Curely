import 'package:curely/constants.dart';
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
          Icon(icon, color: kBlueColor),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(color: kBlueColor)),
        ],
      ),
    );
  }
}
