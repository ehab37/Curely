import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class InfoBox {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context,
    String message,
  ) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void successFloatingBox(BuildContext context) {
    return CherryToast.success(
      inheritThemeColors: true,
      title: const Text('Logout Successful'),
      borderRadius: 0,
    ).show(context);
  }

  void customFloatingBox(BuildContext context) {
    return CherryToast(
      inheritThemeColors: true,
      iconWidget: Icon(Icons.car_repair),
      description: const Text('This is a description message'),
      themeColor: Colors.green,
      toastPosition: Position.bottom,
      textDirection: TextDirection.rtl,
      animationType: AnimationType.fromRight,
      action: const Text('انقر هنا', style: TextStyle(color: Colors.green)),
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  void errorFloatingBox(BuildContext context) {
    return CherryToast.error(
      enableIconAnimation: false,
      inheritThemeColors: true,
      description: const Text('Invalid account information'),
      animationType: AnimationType.fromRight,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  void warningFloatingBox(BuildContext context) {
    return CherryToast.warning(
      inheritThemeColors: true,
      description: const Text(
        'All information may be deleted after this action',
      ),
      animationType: AnimationType.fromTop,
      action: const Text('Backup data'),
      actionHandler: () {},
    ).show(context);
  }

  void infoFloatingBox(BuildContext context) {
    return CherryToast.info(
      disableToastAnimation: true,
      title: const Text(
        'Cherry toast title',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      action: const Text('Toast content description'),
      inheritThemeColors: true,
      displayIcon: false,
      autoDismiss: false,
      toastPosition: Position.top,
      actionHandler: () {},
      onToastClosed: () {},
      horizontalAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
    ).show(context);
  }
}
