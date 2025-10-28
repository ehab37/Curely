import 'package:curely/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const [
        Icon(Icons.home_filled, color: Colors.white),
        Icon(Icons.dashboard_outlined, color: Colors.white),
        Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
        Icon(FontAwesomeIcons.user, color: Colors.white),
      ],
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
