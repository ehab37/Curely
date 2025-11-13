import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

OutlineInputBorder customBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide(color: kNavyColor),
  );
}