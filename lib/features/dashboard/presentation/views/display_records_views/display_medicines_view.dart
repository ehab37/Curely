import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/display_medicines_view_body.dart';

class DisplayMedicinesView extends StatelessWidget {
  const DisplayMedicinesView({super.key});

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
                  Text("Display Medicines", style: Styles.style33),
                ],
              ),
              SizedBox(height: 8),
              DisplayMedicinesViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
