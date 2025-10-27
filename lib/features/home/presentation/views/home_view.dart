import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              FontAwesomeIcons.bars,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.profileView);
              },
              icon: const Icon(
                Icons.account_circle,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: Styles.style18,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ehab Mostafa",
              style: Styles.styleWhite25,
            ),
          ],
        ),
      ),
      // drawer: const HomeDrawer(),
      body: const HomeViewBody(),
    );
  }
}
