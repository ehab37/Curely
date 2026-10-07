import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'add_records_section.dart';
import 'display_records_section.dart';
import 'profile_switcher_widget.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ProfileSwitcherWidget(),
        12.verticalSpacing,
        DisplayRecordsSection(),
        16.verticalSpacing,
        AddRecordsSection(),
        16.verticalSpacing,
      ],
    );
  }
}
