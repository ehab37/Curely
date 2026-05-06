import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MedicineNameField extends StatelessWidget {
  const MedicineNameField({super.key, required this.medicineNameController});

  final TextEditingController medicineNameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: medicineNameController,
      label: context.tr("medicine_name"),
      hint: context.tr("enter_medicine_name"),
      keyboard: TextInputType.name,
      validator: (value) => AppValidators.validateNameArabic(value),
    );
  }
}
