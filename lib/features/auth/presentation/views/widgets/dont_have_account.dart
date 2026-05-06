import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.tr("dont_have_account"),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(text: "  ", style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRoutesConstants.kRegisterView);
              },
            text: context.tr("register"),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
