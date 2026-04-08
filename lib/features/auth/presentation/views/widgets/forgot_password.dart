import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoutesConstants.kResetPasswordView);
        },
        child: Text(
          context.tr("forgot_password"),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
