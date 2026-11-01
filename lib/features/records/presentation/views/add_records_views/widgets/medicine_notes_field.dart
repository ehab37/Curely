import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MedicineNotesField extends StatelessWidget {
  const MedicineNotesField({super.key, required this.medicineNotesController});

  final TextEditingController medicineNotesController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: medicineNotesController,
      label: context.tr("medicine_notes"),
      hint: context.tr("medicine_notes_hint"),
      maxLines: 3,
    );
  }
}
