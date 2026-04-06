import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'already_have_account.dart';
import 'confirm_password_field.dart';
import 'email_field.dart';
import 'name_field.dart';
import 'password_field.dart';
import 'terms_and_conditions_widget.dart';

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
                Text(
                  S.of(context).register,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                40.verticalSpacing,
                NameField(nameController: nameController),
                EmailField(emailController: emailController),
                PasswordField(
                  passwordController: passwordController,
                  isSecure: isSecure,
                  suffixPress: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                ),
                ConfirmPasswordField(
                  passwordController: password2Controller,
                  isSecure: isSecure2,
                  suffixPress: () {
                    isSecure2 = !isSecure2;
                    setState(() {});
                  },
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
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  child: Text(
                    S.of(context).register,
                    style: Theme.of(context).textTheme.headlineSmall,
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
                        InfoBox.warningFloatingBox(
                          context,
                          message: S
                              .of(context)
                              .TermsAndConditionsMustBeAccepted,
                          actionMessage: 'Accept Terms',
                          action: () {
                            setState(() {
                              isAgreeTerms = true;
                            });
                          },
                        );
                      }
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                15.verticalSpacing,
                AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
