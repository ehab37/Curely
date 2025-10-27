import 'package:curely/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      tileColor: kLightGrayColor,
      leading: const Icon(
        FontAwesomeIcons.magnifyingGlass,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 19,
        ),
      ),
    );
  }
}
