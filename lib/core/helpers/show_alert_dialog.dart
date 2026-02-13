import 'package:flutter/material.dart';

Future showAlertDialog({
  required BuildContext context,
  required Widget content,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return content;
    },
  );
}
