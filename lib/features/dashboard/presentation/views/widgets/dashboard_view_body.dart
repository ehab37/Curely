import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'add_records_section.dart';
import 'display_records_section.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.horizontalPadding,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DisplayRecordsSection(),
          16.verticalSpacing,
          AddRecordsSection(),
          16.verticalSpacing,
        ],
      ),
    );
  }
}
