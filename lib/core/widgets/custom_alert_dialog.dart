import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.dialogContext,
    required this.title,
    required this.content,
    this.yesText,
    this.noText,
    required this.onDone,
    this.onCancel,
  });

  final BuildContext dialogContext;
  final String title;
  final String content;
  final String? yesText;
  final String? noText;
  final void Function() onDone;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed:
              onCancel ??
              () {
                GoRouter.of(dialogContext).pop(false);
              },
          child: Text(
            noText ?? context.tr('no'),
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: onDone,
            child: Text(
              yesText ?? context.tr('yes'),
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
