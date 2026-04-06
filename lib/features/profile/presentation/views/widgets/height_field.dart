import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class HeightField extends StatelessWidget {
  const HeightField({super.key, required this.heightController});

  final TextEditingController heightController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: heightController,
      label: 'Height (cm)',
      hint: 'e.g., 175',
      keyboard: TextInputType.number,
      validator: (value) =>
          AppValidators.validateNumberLength(value, AppTextConstants.height),
    );
  }
}
