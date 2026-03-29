import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      label: S.of(context).email,
      hint: S.of(context).enterYourEmail,
      keyboard: TextInputType.emailAddress,
      validator: (value) => AppValidators.validateEmail(value),
      prefixIcon: Icons.email_outlined,
    );
  }
}
