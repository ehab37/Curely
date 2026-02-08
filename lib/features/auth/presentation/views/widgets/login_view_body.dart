import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/spacing.dart';
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
          padding: const EdgeInsets.all(SpacingConstants.horizontalPadding),
          child: Form(
            autovalidateMode: autoValidateMode,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).login, style: Styles.style45),
                40.verticalSpacing,
                CustomTextFormField(
                  controller: emailController,
                  label: S.of(context).email,
                  hint: S.of(context).enterYourEmail,
                  validator: (value) => AppValidators.validateEmail(value),
                  keyboard: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                ),
                CustomTextFormField(
                  label: S.of(context).password,
                  hint: S.of(context).enterYourPassword,
                  controller: passwordController,
                  validator: (value) =>
                      AppValidators.validateLoginPassword(value),
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
                      GoRouter.of(
                        context,
                      ).push(AppRoutesConstants.kResetPasswordView);
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: Styles.styleUnderline16,
                    ),
                  ),
                ),
                24.verticalSpacing,
                CustomButton(
                  backgroundColor: AppColors.darkBlue,
                  child: Text(S.of(context).login, style: Styles.styleWhite20),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().loginUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      FocusScope.of(context).unfocus();
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                8.verticalSpacing,
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.primary)),
                    Text(" ${S.of(context).or} ", style: Styles.styleBlue25),
                    Expanded(child: Divider(color: AppColors.primary)),
                  ],
                ),
                8.verticalSpacing,
                CustomButton(
                  backgroundColor: AppColors.background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsConstants.kGoogleLogo, width: 25),
                      8.horizontalSpacing,
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
                20.verticalSpacing,
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
                            ).pushReplacement(AppRoutesConstants.kRegisterView);
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
