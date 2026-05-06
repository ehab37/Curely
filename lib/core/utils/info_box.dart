import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:curely/core/constants/app_text_constants.dart';
import 'package:easy_localization/easy_localization.dart' as lz;
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        content: content,
      ),
    );
  }

  static TextDirection _getTextDirection(BuildContext context) {
    return context.locale.languageCode == AppTextConstants.kArabic
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  static void infoFloatingBox(BuildContext context, String message) {
    return CherryToast.info(
      inheritThemeColors: true,
      description: Text(message),
      displayCloseButton: false,
      textDirection: _getTextDirection(context),
    ).show(context);
  }

  static void successFloatingBox(BuildContext context, String message) {
    return CherryToast.success(
      inheritThemeColors: true,
      title: Text(message),
      displayCloseButton: false,
      textDirection: _getTextDirection(context),
    ).show(context);
  }

  static void errorFloatingBox(BuildContext context, String message) {
    return CherryToast.error(
      inheritThemeColors: true,
      description: Text(message),
      displayCloseButton: false,
      toastPosition: Position.bottom,
      textDirection: _getTextDirection(context),
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
      textDirection: _getTextDirection(context),
    ).show(context);
  }
}
