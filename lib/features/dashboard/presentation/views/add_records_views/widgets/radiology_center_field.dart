import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RadiologyCenterField extends StatelessWidget {
  const RadiologyCenterField({
    super.key,
    required this.radiologyCenterController,
  });

  final TextEditingController radiologyCenterController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: radiologyCenterController,
      label: context.tr("radiology_center"),
      hint: context.tr("enter_radiology_center_name"),
    );
  }
}
