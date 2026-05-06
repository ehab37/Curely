import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: context.tr("dashboard"),
        icon: FontAwesomeIcons.fileMedical,
      ),
      body: const SafeArea(child: DashboardViewBody()),
    );
  }
}
