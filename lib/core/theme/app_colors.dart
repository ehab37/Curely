import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //Colors
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xffF7F8FC);
  static const Color skyBlue = Color(0xffcae8ff);
  static const Color claimingTeal = Color(0xff00C4B8);
  static const Color brightBlue = Color(0xff347AF0);
  static const Color blue = Color(0xff0D47A1);
  static const Color darkBlue = Color(0xff0B2347);
  static const Color navy = Color(0xff0E3F78);
  static const Color denim = Color(0xff0E1B29);
  static const Color gray = Color(0xffBDBDBD);
  static const Color lightGray = Color(0xffE0E0E0);
  static const Color darkGray = Color(0xff212121);
  static const Color black = Colors.black;

  // Brand
  static const Color primary = navy;
  static const Color secondary = navy;
  static const Color accent = navy;
  static const Color primaryDark = navy;
  static const Color secondaryDark = navy;
  static const Color accentDark = navy;

  static const Color unActive = gray;

  // Backgrounds
  static const Color background = white;
  static const Color background2 = offWhite;
  static const Color gray100 = Color(0xFFF7F7F7);
  static const Color gray200 = Color(0xFFF1F1F1);

  // Text
  static const Color textPrimary = navy; // titles
  static const Color textSecondary = white; // body
  static const Color textMuted = Color(0xFF555555);

  // Links
  static const Color link = Color(0xFF333333);
  static const Color linkHover = Color(0xFF242424);

  // Status
  static const Color success = Color(0xFF459647);
  static const Color warning = Color(0xFFE0B252);
  static const Color error = Color(0xFFCC1010);

  // Borders
  static const Color borderLight = lightGray;
  static const Color borderMedium = navy;

  // Buttons
  static const Color buttonDefault = Color(0xFFF7F7F7);
  static const Color buttonDefaultHover = Color(0xFFEFEFEF);
  static const Color buttonAccent = primary;
  static const Color buttonTextOnPrimary = white;

  //opacity
  Color opacityColor(Color color, double opacity) {
    return color.withAlpha((255 * opacity).round());
  }

  //linear
  static const LinearGradient waves = LinearGradient(
    colors: [Color(0xFF0396FF), Color(0xFFABDCFF)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static const LinearGradient deepSpace = LinearGradient(
    colors: [Color(0xFF4CA1AF), Color(0xFF2C3E50)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
