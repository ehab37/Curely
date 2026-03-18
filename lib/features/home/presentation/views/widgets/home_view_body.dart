import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:curely/features/home/presentation/views/widgets/circle_card.dart';
import 'package:curely/features/home/presentation/views/widgets/home_search_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeRepo homeRepo = getIt<HomeRepo>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingConstants.horizontalPadding,
          vertical: SpacingConstants.topPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSearchWidget(),
            24.verticalSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardCircle(
                  text: "Reminder",
                  icon: Icons.alarm,
                  size: 35,
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRoutesConstants.kDisplayMedicineView,
                      extra: {'isReminderView': true, 'isFavoriteView': false},
                    );
                  },
                ),
                CardCircle(
                  text: "Pharmacy",
                  icon: Icons.local_pharmacy_rounded,
                  onPressed: () async {
                    var result = await homeRepo.nearestPharmacy();
                    result.fold(
                      (l) => InfoBox.customSnackBar(context, l.errMessage),
                      (r) => null,
                    );
                  },
                ),
                CardCircle(
                  text: "Ambulance",
                  icon: FontAwesomeIcons.truckMedical,
                  size: 25,
                  onPressed: () async {
                    await homeRepo.callEmergency();
                  },
                ),
                CardCircle(
                  text: "Doctor Ai",
                  icon: FontAwesomeIcons.userDoctor,
                  onPressed: () {},
                ),
              ],
            ),
            16.verticalSpacing,
            Text(" Add Records", style: Styles.styleBlue25),
            CustomNavBar(
              text: "Add Medicine",
              prefixIcon: FontAwesomeIcons.pills,
              suffixIcon: Icons.add,
              onPressed: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddMedicineView);
              },
            ),
            CustomNavBar(
              text: "Add Prescription",
              prefixIcon: FontAwesomeIcons.fileMedical,
              suffixIcon: Icons.add,
              onPressed: () {
                GoRouter.of(
                  context,
                ).push(AppRoutesConstants.kAddPrescriptionView);
              },
            ),
            CustomNavBar(
              text: "Add Rays",
              prefixIcon: FontAwesomeIcons.xRay,
              suffixIcon: Icons.add,
              onPressed: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddRaysView);
              },
            ),
            CustomNavBar(
              text: "Add Analysis",
              prefixIcon: FontAwesomeIcons.flaskVial,
              suffixIcon: Icons.add,
              onPressed: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddAnalysisView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
