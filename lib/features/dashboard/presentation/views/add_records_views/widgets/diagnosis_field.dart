import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DiagnosisField extends StatelessWidget {
  const DiagnosisField({super.key, required this.diagnosisController});

  final TextEditingController diagnosisController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: diagnosisController,
      label: context.tr("diagnosis"),
      maxLines: 3,
    );
  }
}
