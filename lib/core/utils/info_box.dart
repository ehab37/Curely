import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class InfoBox {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  customSnackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  customImageSnackBar({
    required BuildContext context,
    required Widget content,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.background,
        shape: Border(top: BorderSide(color: AppColors.borderMedium, width: 2)),
        content: content,
      ),
    );
  }

  static void customFloatingBox(BuildContext context, String message) {
    return CherryToast(
      inheritThemeColors: true,
      iconWidget: Icon(Icons.car_repair),
      description: Text(message),
      themeColor: AppColors.success,
      // toastPosition: Position.bottom,
      // action: Text('Press here', style: TextStyle(color: AppColors.success)),
      // animationDuration: const Duration(milliseconds: 1000),
      // autoDismiss: true,
    ).show(context);
  }

  static void successFloatingBox(BuildContext context, String message) {
    return CherryToast.success(
      inheritThemeColors: true,
      title: Text(message),
      displayCloseButton: false,
    ).show(context);
  }

  static void errorFloatingBox(BuildContext context, String message) {
    return CherryToast.error(
      inheritThemeColors: true,
      description: Text(message),
      displayCloseButton: false,
      toastPosition: Position.bottom,
    ).show(context);
  }

  static void warningFloatingBox(
    BuildContext context, {
    required String message,
    String? actionMessage,
    Function? action,
  }) {
    return CherryToast.warning(
      inheritThemeColors: true,
      description: Text(message, style: Theme.of(context).textTheme.bodySmall),
      displayCloseButton: false,
      action: actionMessage == null ? null : Text(actionMessage),
      actionHandler: action,
    ).show(context);
  }
}
