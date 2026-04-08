import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      label: context.tr("name"),
      hint: context.tr("enter_your_name"),
      keyboard: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      validator: (value) => AppValidators.validateName(value),
    );
  }
}
