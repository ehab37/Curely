import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:curely/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:curely/features/home/presentation/views/widgets/home_drawer.dart';
import 'package:curely/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: kNavyColor,
        leading: Builder(
          builder: (context) => CustomIconButton(
            icon: FontAwesomeIcons.bars,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(onPressed:(){
              GoRouter.of(context).push(AppRouter.kProfileView);
            },icon: Icons.account_circle,),
          ),
        ],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello", style: Styles.style18),
            SizedBox(height: 5),
            Text("Ehab Mostafa", style: Styles.styleWhite25),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      drawer: const HomeDrawer(),
      body: const HomeViewBody(),
    );
  }
}
