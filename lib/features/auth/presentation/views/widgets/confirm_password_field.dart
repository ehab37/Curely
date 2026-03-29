import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
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
      controller: passwordController,
      label: S.of(context).confirmPassword,
      hint: S.of(context).confirmYourPassword,
      keyboard: TextInputType.visiblePassword,
      isSecure: isSecure,
      suffixIcon: isSecure
          ? Icons.visibility_off_outlined
          : Icons.remove_red_eye_outlined,
      suffixPress: suffixPress,
      validator: (value) =>
          AppValidators.validateConfirmPassword(value, passwordController.text),
    );
  }
}
