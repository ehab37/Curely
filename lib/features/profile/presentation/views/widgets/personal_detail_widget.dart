import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PersonalDetailWidget extends StatelessWidget {
  const PersonalDetailWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          color: kBlue32Color.withAlpha(100),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: kBlue32Color,
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Icon(icon, color: kNavyColor),
            ),
            SizedBox(width: 12),
            Column(
              children: [
                Text(title, style: Styles.styleWhite20),
                Text(
                  subTitle,
                  style: Styles.style15.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
