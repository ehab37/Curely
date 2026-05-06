import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WeightField extends StatelessWidget {
  const WeightField({super.key, required this.weightController});

  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: weightController,
      label: context.tr('weight_kg'),
      hint: context.tr('weight_hint'),
      keyboard: TextInputType.number,
      validator: (value) => AppValidators.validateNumberLength(value),
    );
  }
}
