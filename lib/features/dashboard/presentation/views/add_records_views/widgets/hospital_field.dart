import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HospitalField extends StatelessWidget {
  const HospitalField({super.key, required this.hospitalController});

  final TextEditingController hospitalController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: hospitalController,
      label: context.tr("hospital_or_clinic"),
      hint: context.tr("enter_examination_place"),
    );
  }
}
