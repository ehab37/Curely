import 'dart:io';

import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DisplayedItem extends StatelessWidget {
  const DisplayedItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.file,
  });

  final File file;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(kBorderRadius),
        side: BorderSide(color: kNavyColor),
      ),
      color: Colors.white,
      elevation: 8,
      child: Column(
        children: [
          Spacer(),
          Image.file(
            file,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 4,
          ),
          Spacer(),
          Text(text1, style: Styles.styleBlue20),
          Text(text2, style: Styles.style16),
          Text(text3, style: Styles.style16),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
