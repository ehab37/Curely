import 'package:curely/core/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

OutlineInputBorder customBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
    borderSide: BorderSide(color: Theme.of(context).primaryColor),
  );
}
