import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BloodField extends StatelessWidget {
  const BloodField({
    super.key,
    required this.bloodController,
    required this.bloodFocus,
    required this.nextFocus,
  });

  final TextEditingController bloodController;
  final FocusNode bloodFocus;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: bloodController,
      focusNode: bloodFocus,
      label: context.tr('blood_type'),
      hint: context.tr('blood_type_hint'),
      textCapitalization: TextCapitalization.characters,
      onSubmit: (p0) => FocusScope.of(context).requestFocus(nextFocus),
      validator: (value) => AppValidators.validateBloodType(value),
    );
  }
}
