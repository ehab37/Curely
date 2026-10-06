import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/profile/presentation/views/widgets/manage_dependents_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManageDependentsView extends StatelessWidget {
  const ManageDependentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: context.tr("manage_profiles"),
        isBackable: true,
        icon: FontAwesomeIcons.usersGear,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: ManageDependentsViewBody(),
        ),
      ),
    );
  }
}
