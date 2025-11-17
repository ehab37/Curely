import 'package:curely/constants.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/add_analysis_view_body.dart';

class AddAnalysisView extends StatelessWidget {
  const AddAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              CustomAppBar(title: "Add Analysis"),
              AddAnalysisViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
