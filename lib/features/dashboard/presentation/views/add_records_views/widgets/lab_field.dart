import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LabField extends StatelessWidget {
  const LabField({super.key, required this.labController});

  final TextEditingController labController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: labController,
      label: "Lab",
      hint: "Enter Lab Name",
    );
  }
}
