import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
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
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 20.0),
        child: const Icon(Icons.delete, color: AppColors.background),
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (DismissDirection direction) async {
        return await showAlertDialog(
          context: context,
          content: CustomAlertDialog(
            dialogContext: context,
            title: context.tr('delete_record_title'),
            content: context.tr('delete_record_content'),
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
