import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MedicineNotesField extends StatelessWidget {
  const MedicineNotesField({super.key, required this.medicineNotesController});

  final TextEditingController medicineNotesController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: medicineNotesController,
      label: "Medicine Notes",
      hint: "Please, Enter any missing information about the medicine.",
      maxLines: 3,
    );
  }
}
