import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecordsDismissibleWidget extends StatelessWidget {
  const RecordsDismissibleWidget({
    super.key,
    required this.recordKey,
    required this.onDismissed,
    required this.content,
  });

  final String recordKey;
  final void Function(DismissDirection) onDismissed;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(recordKey),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(
            SpacingConstants.borderRadius,
          ),
          color: AppColors.error,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: const Icon(Icons.delete, color: AppColors.background),
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (DismissDirection direction) async {
        return await showAlertDialog(
          context: context,
          content: CustomAlertDialog(
            dialogContext: context,
            title: 'Delete Record?',
            content: 'Are you sure you want to delete this record?',
            onDone: () {
              GoRouter.of(context).pop(true);
            },
          ),
        );
      },
      onDismissed: onDismissed,
      child: content,
    );
  }
}
