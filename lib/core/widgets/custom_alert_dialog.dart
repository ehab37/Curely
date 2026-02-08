import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.dialogContext,
    required this.title,
    required this.content,
    required this.onDone,
  });

  final BuildContext dialogContext;
  final String title;
  final String content;
  final void Function() onDone;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
      ),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text('No', style: TextStyle(color: AppColors.textPrimary)),
          onPressed: () {
            Navigator.of(dialogContext).pop();
          },
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.textPrimary),
          ),
          onPressed: onDone,
          child: Text('Yes', style: TextStyle(color: AppColors.textSecondary)),
        ),
      ],
    );
  }
}
