import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationAlertDialog extends StatelessWidget {
  const VerificationAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRepo authRepo = getIt<AuthRepo>();
    return AlertDialog(
      title: Text(context.tr("verify_email_title")),
      content: Text(context.tr("verify_email_content")),
      actions: [
        TextButton(
          onPressed: () async {
            await authRepo.goToGmail();
          },
          child: Text(context.tr("go_to_gmail")),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            GoRouter.of(context).pushReplacement(AppRoutesConstants.kLoginView);
          },
          child: Text(context.tr("back_to_login")),
        ),
      ],
    );
  }
}
