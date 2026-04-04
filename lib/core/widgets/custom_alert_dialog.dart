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
            'No',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          onPressed: () {
            GoRouter.of(dialogContext).pop(false);
          },
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: onDone,
          child: Text(
            'Yes',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
