import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isSecure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                Text(S.of(context).login, style: Styles.style45),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: emailController,
                  label: S.of(context).email,
                  hint: S.of(context).enterYourEmail,
                  validation: (value) => emailValidator(value, context),
                  keyboard: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  label: S.of(context).password,
                  hint: S.of(context).enterYourPassword,
                  controller: passwordController,
                  validation: (value) => passwordValidator(value, context),
                  isSecure: isSecure,
                  suffixIcon: isSecure
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  suffixPress: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kResetPasswordView);
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: Styles.styleUnderline16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  backgroundColor: kDarkBlueColor,
                  child: Text(S.of(context).login, style: Styles.styleWhite20),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      FocusScope.of(context).unfocus();
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: Divider(color: kNavyColor)),
                    Text(" ${S.of(context).or} ", style: Styles.styleBlue25),
                    Expanded(child: Divider(color: kNavyColor)),
                  ],
                ),
                const SizedBox(height: 8),
                CustomButton(
                  backgroundColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsData.kGoogleLogo, width: 25),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).loginWithGoogle,
                        style: Styles.styleBlue20,
                      ),
                    ],
                  ),
                  onPressed: () {
                    context.read<LoginCubit>().loginUserWithGoogle();
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).dontHaveAccount,
                        style: Styles.style15,
                      ),
                      const TextSpan(text: "  ", style: Styles.style15),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.kRegisterView);
                          },
                        text: S.of(context).register,
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
