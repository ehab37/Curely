import 'package:curely/features/home/presentation/views/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              " Dashboard",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CustomNavBar(
          text: "Display Medicines",
          prefixIcon: FontAwesomeIcons.pills,
          suffixIcon: Icons.arrow_forward_ios,
          onPressed: (){
            // GoRouter.of(context).push(AppRouter.displayMedicine);
          },
        ),
        CustomNavBar(
          text: "Display Rays",
          prefixIcon: FontAwesomeIcons.xRay,
          suffixIcon: Icons.arrow_forward_ios,
          onPressed: (){
            // GoRouter.of(context).push(AppRouter.displayRays);
          },
        ),
        CustomNavBar(
          text: "Display Prescriptions",
          prefixIcon: FontAwesomeIcons.fileMedical,
          suffixIcon: Icons.arrow_forward_ios,
          onPressed: (){
            // GoRouter.of(context).push(AppRouter.displayPrescreption);
          },
        ),
        CustomNavBar(
          text: "Display Analysis",
          prefixIcon: FontAwesomeIcons.flaskVial,
          suffixIcon: Icons.arrow_forward_ios,
          onPressed: (){
            // GoRouter.of(context).push(AppRouter.displayAnalysis);
          },
        ),
      ],
    );
  }
}
