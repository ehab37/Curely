import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.nameController,
    required this.nextFocus,
  });

  final TextEditingController nameController;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      label: context.tr("name"),
      hint: context.tr("enter_your_name"),
      keyboard: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onSubmit: (p0) => FocusScope.of(context).requestFocus(nextFocus),
      validator: (value) => AppValidators.validateName(value),
      autoFocus: true,
    );
  }
}
