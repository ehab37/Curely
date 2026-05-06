import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/core/widgets/title_sub_title_back.dart';
import 'package:curely/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_double_material.dart';
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
          horizontal: SpacingConstants.horizontalPadding,
          vertical: 12,
        ),
        child: Column(
          children: [
            TitleSubTitleBack(
              title: context.tr('reset_password'),
              subTitle: context.tr('reset_password_subtitle'),
            ),
            const Spacer(),
            CustomDoubleMaterial(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Form(
                    autovalidateMode: autoValidateMode,
                    key: formKey,
                    child: CustomTextFormField(
                      controller: emailController,
                      label: context.tr('email'),
                      hint: context.tr('enter_your_email'),
                      validator: (value) => AppValidators.validateEmail(value),
                      keyboard: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                    ),
                  ),
                  BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                    listener: (context, state) {
                      if (state is ResetPasswordFailure) {
                        InfoBox.errorFloatingBox(context, state.errMessage);
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap:
                            state is! ResetPasswordSuccess ||
                                state is! ResetPasswordLoading
                            ? () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context
                                      .read<ResetPasswordCubit>()
                                      .resetPassword(
                                        email: emailController.text.trim(),
                                      );
                                  FocusScope.of(context).unfocus();
                                } else {
                                  setState(() {
                                    autoValidateMode = AutovalidateMode.always;
                                  });
                                }
                              }
                            : null,
                        child: Material(
                          color: Theme.of(context).colorScheme.onPrimary,
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
                                        ? Icons.link
                                        : Icons.restart_alt,
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
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
