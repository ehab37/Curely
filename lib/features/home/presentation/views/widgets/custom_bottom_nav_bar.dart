import 'package:curely/core/theme/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.bottomNavigationKey,
    required this.onTap,
  });

  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;
  final void Function(int) onTap;

  List<Icon> get bottomNavBarIconsList => const [
    Icon(Icons.home_filled, color: Colors.white),
    Icon(Icons.dashboard_outlined, color: Colors.white),
    Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
    Icon(FontAwesomeIcons.user, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      items: bottomNavBarIconsList,
      onTap: onTap,
      color: AppColors.primary,
      animationDuration: Duration(milliseconds: 400),
      backgroundColor: Colors.transparent,
      height: 70,
    );
  }
}
