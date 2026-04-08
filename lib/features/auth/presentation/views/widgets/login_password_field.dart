import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.passwordController,
    required this.isSecure,
    required this.suffixPress,
  });

  final TextEditingController passwordController;
  final bool isSecure;
  final void Function() suffixPress;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: context.tr('password'),
      hint: context.tr('enter_your_password'),
      controller: passwordController,
      validator: (value) => AppValidators.validateLoginPassword(value),
      isSecure: isSecure,
      suffixIcon: isSecure
          ? Icons.visibility_off_outlined
          : Icons.remove_red_eye_outlined,
      suffixPress: suffixPress,
    );
  }
}
