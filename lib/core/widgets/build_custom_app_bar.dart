import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_back_bar.dart';

AppBar buildCustomAppBar({
  required String title,
  FaIconData? icon,
  bool isBackable = false,
  void Function()? onTap,
}) {
  return AppBar(
    leading: isBackable ? CustomBackBar() : null,
    title: Text(title),
    actions: [
      ?icon != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(onTap: onTap, child: FaIcon(icon)),
            )
          : null,
    ],
  );
}
