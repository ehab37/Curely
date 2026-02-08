import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:curely/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:curely/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isSecure = true;
  bool isSecure2 = true;
  bool isAgreeTerms = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SpacingConstants.horizontalPadding),
          child: Form(
            autovalidateMode: autoValidateMode,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).register, style: Styles.style45),
                40.verticalSpacing,
                CustomTextFormField(
                  controller: nameController,
                  label: S.of(context).name,
                  hint: S.of(context).enterYourName,
                  keyboard: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => AppValidators.validateName(value),
                ),
                CustomTextFormField(
                  controller: emailController,
                  label: S.of(context).email,
                  hint: S.of(context).enterYourEmail,
                  keyboard: TextInputType.emailAddress,
                  validator: (value) => AppValidators.validateEmail(value),
                  prefixIcon: Icons.email_outlined,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  label: S.of(context).password,
                  hint: S.of(context).enterYourPassword,
                  keyboard: TextInputType.visiblePassword,
                  isSecure: isSecure,
                  suffixIcon: isSecure
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  suffixPress: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                  validator: (value) => AppValidators.validatePassword(value),
                ),
                CustomTextFormField(
                  controller: password2Controller,
                  label: S.of(context).confirmPassword,
                  hint: S.of(context).confirmYourPassword,
                  keyboard: TextInputType.visiblePassword,
                  isSecure: isSecure2,
                  suffixIcon: isSecure2
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  suffixPress: () {
                    isSecure2 = !isSecure2;
                    setState(() {});
                  },
                  validator: (value) => AppValidators.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),
                TermsAndConditionsWidget(
                  onChanged: (value) {
                    isAgreeTerms = value ?? false;
                    setState(() {});
                  },
                  isChecked: isAgreeTerms,
                  onTermsPressed: () async {
                    final result = await GoRouter.of(
                      context,
                    ).push(AppRoutesConstants.kTermsAndConditionsView);
                    if (result != null && result is bool && result == true) {
                      setState(() {
                        isAgreeTerms = true;
                      });
                    }
                  },
                ),
                24.verticalSpacing,
                CustomButton(
                  backgroundColor: AppColors.darkBlue,
                  child: Text(
                    S.of(context).register,
                    style: Styles.styleWhite20,
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (isAgreeTerms) {
                        formKey.currentState!.save();
                        context.read<RegisterCubit>().createAccount(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          name: nameController.text.trim(),
                        );
                        FocusScope.of(context).unfocus();
                      } else {
                        InfoBox.customSnackBar(
                          context,
                          S.of(context).TermsAndConditionsMustBeAccepted,
                        );
                      }
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                15.verticalSpacing,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).alreadyHaveAccount,
                        style: Styles.style15,
                      ),
                      const TextSpan(text: "  ", style: Styles.style15),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRoutesConstants.kLoginView);
                          },
                        text: '${S.of(context).login}!',
                        style: Styles.styleUnderline16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
