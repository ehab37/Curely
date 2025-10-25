import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_indicator_widget.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 12,
        ),
        child: Column(
          children: [
            CustomBackBar(),
            Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Material(
                color: Colors.white,
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(kHorizontalPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Form(
                            key: formKey,
                            child: CustomTextFormField(
                              controller: emailController,
                              label: "E-mail",
                              hint: "Enter your email",
                              validation: (value) => emailValidator(value),
                              keyboard: TextInputType.emailAddress,
                            ),
                          ),
                          BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                            listener: (context, state) {
                              if (state is ResetPasswordFailure) {
                                InfoBox().customSnackBar(
                                  context,
                                  state.errMessage,
                                );
                              }
                            },
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: state is! ResetPasswordSuccess
                                    ? () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          context
                                              .read<ResetPasswordCubit>()
                                              .resetPassword(
                                                email: emailController.text,
                                              );
                                          FocusScope.of(context).unfocus();
                                        } else {
                                          autoValidateMode =
                                              AutovalidateMode.always;
                                        }
                                      }
                                    : null,
                                child: Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  type: MaterialType.circle,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: state is ResetPasswordLoading
                                        ? CustomIndicatorWidget()
                                        : Icon(
                                            state is ResetPasswordSuccess
                                                ? Icons.done
                                                : state is ResetPasswordInitial
                                                ? Icons.arrow_forward_outlined
                                                : Icons.restart_alt,
                                            color: kNavyColor,
                                            size: 40,
                                          ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
