import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(
            context.tr('no'),
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          onPressed: () {
            GoRouter.of(dialogContext).pop(false);
          },
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
              context.tr('yes'),
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
