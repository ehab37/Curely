import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class BloodField extends StatelessWidget {
  const BloodField({super.key, required this.bloodController});

  final TextEditingController bloodController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: bloodController,
      label: 'Blood Type',
      hint: 'e.g., A+',
      textCapitalization: TextCapitalization.characters,
      validator: (value) => AppValidators.validateBloodType(value),
    );
  }
}
