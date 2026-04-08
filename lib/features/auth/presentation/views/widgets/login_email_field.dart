import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      label: context.tr('email'),
      hint: context.tr('enter_your_email'),
      validator: (value) => AppValidators.validateEmail(value),
      keyboard: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
    );
  }
}
