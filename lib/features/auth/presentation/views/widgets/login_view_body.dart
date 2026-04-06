import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dont_have_account.dart';
import 'login_email_field.dart';
import 'forgot_password.dart';
import 'google_button.dart';
import 'or_widget.dart';
import 'login_password_field.dart';

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
                Text(
                  S.of(context).login,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                40.verticalSpacing,
                LoginEmailField(emailController: emailController),
                LoginPasswordField(
                  passwordController: passwordController,
                  isSecure: isSecure,
                  suffixPress: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                ),
                ForgotPassword(),
                24.verticalSpacing,
                CustomButton(
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  child: Text(
                    S.of(context).login,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
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
                OrWidget(),
                8.verticalSpacing,
                GoogleButton(),
                20.verticalSpacing,
                DontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
