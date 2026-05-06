import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    super.key,
    required this.passwordController,
    required this.isSecure,
    required this.suffixPress,
    required this.confirmPasswordController,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isSecure;
  final void Function() suffixPress;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: confirmPasswordController,
      label: context.tr("confirm_password"),
      hint: context.tr("confirm_your_password"),
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
