import 'package:flutter/material.dart';

extension SpacingExtension on num {
  Widget get verticalSpacing => SizedBox(height: toDouble());
  Widget get horizontalSpacing => SizedBox(width: toDouble());
}
