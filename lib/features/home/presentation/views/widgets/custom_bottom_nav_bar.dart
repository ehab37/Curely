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

  List<Widget> bottomNavBarIconsList(BuildContext context) => [
    Icon(Icons.home_filled, color: Theme.of(context).colorScheme.onPrimary),
    Icon(
      Icons.dashboard_outlined,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    Icon(
      FontAwesomeIcons.magnifyingGlass,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    Icon(
      Icons.favorite_border_outlined,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    Icon(FontAwesomeIcons.user, color: Theme.of(context).colorScheme.onPrimary),
  ];

  @override
  Widget build(BuildContext context) {
    double bottomIndicatorHeight = MediaQuery.viewPaddingOf(context).bottom;
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      items: bottomNavBarIconsList(context),
      onTap: onTap,
      color: Theme.of(context).primaryColor,
      animationDuration: Duration(milliseconds: 400),
      backgroundColor: Colors.transparent,
      height: bottomIndicatorHeight == 0 ? 58 : 30 + bottomIndicatorHeight,
    );
  }
}
