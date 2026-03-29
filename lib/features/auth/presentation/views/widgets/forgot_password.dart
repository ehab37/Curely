import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/generated/l10n.dart';
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
          S.of(context).forgotPassword,
          style: Styles.styleUnderline16.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
