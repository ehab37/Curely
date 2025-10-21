import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
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
          padding: const EdgeInsets.all(kHorizontalPadding),
          child: Form(
            autovalidateMode: autoValidateMode,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).register, style: Styles.style45),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: nameController,
                  label: S.of(context).name,
                  hint: "Enter your name",
                  keyboard: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  validation: (value) => nameValidator(value),
                ),
                CustomTextFormField(
                  controller: emailController,
                  label: 'E-mail',
                  hint: "Enter your email",
                  keyboard: TextInputType.emailAddress,
                  validation: (value) => emailValidator(value),
                  prefixIcon: Icons.email_outlined,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  label: "Password",
                  hint: "Enter your password",
                  keyboard: TextInputType.visiblePassword,
                  isSecure: isSecure,
                  suffixIcon: isSecure
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  suffixPress: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                  validation: (value) => passwordValidator(value),
                ),
                CustomTextFormField(
                  controller: password2Controller,
                  label: "Confirm password",
                  hint: "Confirm your password",
                  keyboard: TextInputType.visiblePassword,
                  isSecure: isSecure2,
                  suffixIcon: isSecure2
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  suffixPress: () {
                    isSecure2 = !isSecure2;
                    setState(() {});
                  },
                  validation: (value) =>
                      confirmPasswordValidator(value, passwordController.text),
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
                    ).push(AppRouter.kTermsAndConditionsView);
                    if (result != null && result is bool && result == true) {
                      setState(() {
                        isAgreeTerms = true;
                      });
                    }
                  },
                ),
                const SizedBox(height: 25),
                CustomButton(
                  backgroundColor: kDarkBlueColor,
                  child: Text("Register", style: Styles.styleWhite20),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (isAgreeTerms) {
                        formKey.currentState!.save();
                        context.read<RegisterCubit>().createAccount(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        );
                        FocusScope.of(context).unfocus();
                      } else {
                        InfoBox().customSnackBar(
                          context,
                          "Terms and Conditions must be accepted!",
                        );
                      }
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 15),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have account?",
                        style: Styles.style15,
                      ),
                      const TextSpan(text: "  ", style: Styles.style15),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.kLoginView);
                          },
                        text: "Login!",
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
