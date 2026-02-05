import 'dart:developer';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/services/url_services.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:flutter/material.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl({required this.urlServices});

  final UrlServices urlServices;

  @override
  Future<void> callEmergency({required BuildContext context}) async {
    try {
      await urlServices.navigateToPhone(phoneNumber: "123");
    } catch (e) {
      log(e.toString());
      if (context.mounted) {
        InfoBox.customSnackBar(
          context,
          "Something went wrong, try again later",
        );
      }
    }
  }
}
