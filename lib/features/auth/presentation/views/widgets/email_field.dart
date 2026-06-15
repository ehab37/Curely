import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
    required this.emailFocus,
    required this.nextFocus,
  });

  final TextEditingController emailController;
  final FocusNode emailFocus;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      focusNode: emailFocus,
      label: context.tr("email"),
      hint: context.tr("enter_your_email"),
      keyboard: TextInputType.emailAddress,
      validator: (value) => AppValidators.validateEmail(value),
      prefixIcon: Icons.email_outlined,
      onSubmit: (_) => FocusScope.of(context).requestFocus(nextFocus),
    );
  }
}
