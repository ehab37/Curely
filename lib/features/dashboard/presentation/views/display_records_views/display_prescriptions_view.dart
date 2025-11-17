import 'package:curely/constants.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_prescriptions_view_body.dart';
import 'package:flutter/material.dart';

class DisplayPrescriptionsView extends StatelessWidget {
  const DisplayPrescriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              CustomAppBar(title: "Add Prescription"),
              DisplayPrescriptionsViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
