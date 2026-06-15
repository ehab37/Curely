import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HeightField extends StatelessWidget {
  const HeightField({
    super.key,
    required this.heightController,
    required this.heightFocus,
    required this.nextFocus,
  });

  final TextEditingController heightController;
  final FocusNode heightFocus;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: heightController,
      focusNode: heightFocus,
      label: context.tr('height_cm'),
      hint: context.tr('height_cm_hint'),
      keyboard: TextInputType.number,
      onSubmit: (p0) => FocusScope.of(context).requestFocus(nextFocus),
      validator: (value) => AppValidators.validateNumberLength(value),
    );
  }
}
