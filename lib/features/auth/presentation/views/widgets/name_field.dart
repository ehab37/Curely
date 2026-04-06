import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      label: S.of(context).name,
      hint: S.of(context).enterYourName,
      keyboard: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      validator: (value) => AppValidators.validateName(value),
    );
  }
}
