import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class DoctorNameField extends StatelessWidget {
  const DoctorNameField({super.key, required this.doctorNameController});

  final TextEditingController doctorNameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: doctorNameController,
      label: "Doctor Name",
      hint: "Enter Doctor Name",
      keyboard: TextInputType.name,
      validator: (value) => AppValidators.validateName(value),
    );
  }
}
