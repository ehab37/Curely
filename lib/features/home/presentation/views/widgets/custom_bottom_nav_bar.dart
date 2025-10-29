import 'package:curely/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(key: _bottomNavigationKey,
      items: bottomNavBarIconsList,
      onTap: (index) {
        setState(
              () {
            selectedIndex = index;
          },
        );
      },
      color: kNavyColor,
      animationDuration: kTransitionDuration,
      backgroundColor: Colors.transparent,
      height: 60,
    );
  }
}
