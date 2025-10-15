import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle style45 = TextStyle(
    color: kNavyColor,
    fontSize: 45,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.5,
    height: .8,
  );
  static const TextStyle style28 = TextStyle(
    color: kNavyColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle styleBlue25 = TextStyle(
    color: kNavyColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle styleWhite25 = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle style20 = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    wordSpacing: .1,
    height: 0,
  );

  static TextStyle style18 = TextStyle(
    color: kNavyColor.withAlpha(160),
    fontSize: 18,
    fontWeight: FontWeight.w400,
    wordSpacing: .1,
    height: 0,
  );

  static const TextStyle style16 = TextStyle(
    color: kNavyColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle styleUnderline16 = TextStyle(
    color: kNavyColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    decoration:TextDecoration.underline,
  );

  static const TextStyle style15 = TextStyle(
    color: kNavyColor,
    fontSize: 15,
    wordSpacing: .1,
    height: 0,
    fontWeight: FontWeight.w400,
  );
}
