import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).alreadyHaveAccount,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(text: "  ", style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRoutesConstants.kLoginView);
              },
            text: '${S.of(context).login}!',
            style: Styles.styleUnderline16.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
