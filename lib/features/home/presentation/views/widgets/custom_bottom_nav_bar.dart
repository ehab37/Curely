import 'package:curely/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.bottomNavigationKey,
    required this.onTap,
  });

  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      items: bottomNavBarIconsList,
      onTap: onTap,
      color: kNavyColor,
      animationDuration: kTransitionDuration,
      backgroundColor: Colors.transparent,
      height: 60,
    );
  }
}
