import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/services/local_notifications_service.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

Future<void> notificationPermission({
  required BuildContext context,
  String? contentText,
  required void Function(bool) onPermissionResult,
}) async {
  final notificationService = getIt<LocalNotificationsService>();
  bool isAllowed = await notificationService.checkPermissionStatus(context);
  if (isAllowed) {
    onPermissionResult(true);
  } else {
    if (context.mounted) {
      showAlertDialog(
        context: context,
        content: CustomAlertDialog(
          dialogContext: context,
          title: "notification_permission_title".tr(),
          content: contentText ?? "medicine_reminder_permission".tr(),
          yesText: "enable".tr(),
          noText: "not_now".tr(),
          onDone: () async {
            GoRouter.of(context).pop(false);
            bool granted = await notificationService.requestPermissions(
              context,
            );
            if (granted) {
              onPermissionResult(true);
            } else {
              if (context.mounted) {
                showAlertDialog(
                  context: context,
                  content: CustomAlertDialog(
                    dialogContext: context,
                    title: "permissions_required".tr(),
                    content: "notifications_disabled_message".tr(),
                    yesText: "open_settings".tr(),
                    noText: "cancel".tr(),
                    onDone: () async {
                      GoRouter.of(context).pop(false);
                      await Geolocator.openAppSettings();
                    },
                    onCancel: () {
                      GoRouter.of(context).pop(false);
                      InfoBox.errorFloatingBox(
                        context,
                        "enable_notifications_error".tr(),
                      );
                    },
                  ),
                );
              }
              onPermissionResult(false);
            }
          },
        ),
      );
    }
  }
}
