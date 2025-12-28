import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DisplayedItem extends StatelessWidget {
  const DisplayedItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    this.imageUrl,
  });

  final String? imageUrl;
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
          imageUrl == null
              ? Icon(FontAwesomeIcons.pills, size: 50, color: kNavyColor)
              : Image.network(imageUrl!, width: 60, height: 60),
          Spacer(),
          Text(text1, style: Styles.styleBlue20),
          Align(child: SizedBox(height: 4)),
          Text(text2, style: Styles.style16),
          SizedBox(height: 4),
          Text(
            DateFormat("dd/MM/yyyy").format(DateTime.parse(text3)).toString(),
            style: Styles.style16,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
