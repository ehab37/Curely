import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LabField extends StatelessWidget {
  const LabField({super.key, required this.labController});

  final TextEditingController labController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: labController,
      label: context.tr("lab_name"),
      hint: context.tr("enter_lab_name"),
    );
  }
}
