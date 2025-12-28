import 'package:curely/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:curely/features/home/presentation/views/home_view.dart';
import 'package:curely/features/home/presentation/views/search_view.dart';
import 'package:curely/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:curely/features/profile/presentation/views/profile_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        bottomNavigationKey: _bottomNavigationKey,
        onTap: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentViewIndex,
        children: [
          HomeView(bottomNavigationKey: _bottomNavigationKey),
          DashboardView(),
          SearchView(),
          ProfileView(),
        ],
      ),
    );
  }
}
