import 'package:curely/constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/features/home/presentation/views/widgets/add_record_item.dart';
import 'package:curely/core/widgets/custom_search_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
            AddRecordsItem(
              text: "Add Medicine",
              prefixIcon: FontAwesomeIcons.pills,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addMedicine);
              },
            ),
            AddRecordsItem(
              text: "Add Rays",
              prefixIcon: FontAwesomeIcons.xRay,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addRays);
              },
            ),
            AddRecordsItem(
              text: "Add Prescription",
              prefixIcon: FontAwesomeIcons.fileMedical,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addPrescription);
              },
            ),
            AddRecordsItem(
              text: "Add Analysis",
              prefixIcon: FontAwesomeIcons.flaskVial,
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.addAnalysis);
              },
            ),
            CustomButton(
              onPressed: () async {
                await GoogleSignIn.instance.signOut();
                await FirebaseAuth.instance.signOut();
                GoRouter.of(context).pushReplacement(AppRouter.kWelcomeView);
                CacheHelper.removeData(key: kIsUserLogin);
              },
              backgroundColor: kNavyColor,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
