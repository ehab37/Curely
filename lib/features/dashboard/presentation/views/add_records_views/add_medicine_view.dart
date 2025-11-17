import 'package:curely/constants.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/add_medicine_view_body.dart';

class AddMedicineView extends StatelessWidget {
  const AddMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              CustomAppBar(title: "Add Medicine"),
              AddMedicineViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
