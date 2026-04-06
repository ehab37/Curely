import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class WeightField extends StatelessWidget {
  const WeightField({super.key, required this.weightController});

  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: weightController,
      label: 'Weight (kg)',
      hint: 'e.g., 70',
      keyboard: TextInputType.number,
      validator: (value) =>
          AppValidators.validateNumberLength(value, AppTextConstants.weight),
    );
  }
}
