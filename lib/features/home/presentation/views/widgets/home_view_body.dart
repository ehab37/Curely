import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/core/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'circle_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kTopPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(text: "Search at records"),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardCircle(
                  text: "Reminder",
                  icon: Icons.alarm,
                  size: 35,
                  onPressed: () {},
                ),
                CardCircle(
                  text: "Pharmacy",
                  icon: Icons.local_pharmacy_rounded,
                  onPressed: () async {
                    // await getCurrentLocation();
                    // await navigateToNearestPharmacy();
                  },
                ),
                CardCircle(
                  text: "Ambulance",
                  icon: FontAwesomeIcons.truckMedical,
                  size: 25,
                  onPressed: () {
                    // navigateToPhone("123");
                  },
                ),
                CardCircle(
                  text: "Pill",
                  icon: FontAwesomeIcons.pills,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              " Add Records",
              style: Styles.style28,
            ),
            CustomNavBar(
              text: "Add Medicine",
              prefixIcon: FontAwesomeIcons.pills,
              suffixIcon: Icons.add,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kAddMedicineView);
              },
            ),
            CustomNavBar(
              text: "Add Rays",
              prefixIcon: FontAwesomeIcons.xRay,
              suffixIcon: Icons.add,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addRays);
              },
            ),
            CustomNavBar(
              text: "Add Prescription",
              prefixIcon: FontAwesomeIcons.fileMedical,
              suffixIcon: Icons.add,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addPrescription);
              },
            ),
            CustomNavBar(
              text: "Add Analysis",
              prefixIcon: FontAwesomeIcons.flaskVial,
              suffixIcon: Icons.add,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addAnalysis);
              },
            ),
          ],
        ),
      ),
    );
  }
}
