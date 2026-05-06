import 'dart:developer';
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

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  String? get nullIfEmpty => this!.trim().isEmpty ? null : this;

  String toReadableDateAndTime() {
    return "${DateFormat('hh:mm a').format(DateTime.parse(this!))} - ${DateFormat('dd/MM/yyyy').format(DateTime.parse(this!))}";
  }

  String toReadableDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(this!));
  }

  String toReadableTime() {
    return DateFormat('hh:mm a').format(DateTime.parse(this!));
  }

  int? get calculateAge {
    if (isNullOrEmpty) {
      return null;
    }
    try {
      final birthDate = DateTime.parse(this!);
      final today = DateTime.now();
      int age = today.year - birthDate.year;
      // Check if birthday has occurred yet this year
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      log('Error parsing date for age calculation: $e');
      return null;
    }
  }
}

extension ListExtension<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
