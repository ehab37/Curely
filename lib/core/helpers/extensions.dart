import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension SpacingExtension on num {
  Widget get verticalSpacing => SizedBox(height: toDouble());

  Widget get horizontalSpacing => SizedBox(width: toDouble());
}

extension TimestampExtension on Timestamp {
  String toReadableDateAndTime() {
    return "${DateFormat('hh:mm a').format(toDate())} - ${DateFormat('dd/MM/yyyy').format(toDate())}";
  }

  String toReadableDate() {
    return DateFormat('dd/MM/yyyy').format(toDate());
  }

  String toReadableTime() {
    return DateFormat('hh:mm a').format(toDate());
  }
}
