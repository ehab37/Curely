import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/add_prescription_view_body.dart';

class AddPrescriptionView extends StatelessWidget {
  const AddPrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  CustomBackBar(),
                  Text("Add Prescription", style: Styles.style33),
                ],
              ),
              SizedBox(height: 8),
              AddPrescriptionViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
