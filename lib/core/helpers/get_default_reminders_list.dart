import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

List<TimeOfDay> getDefaultRemindersList(String frequency) {
  List<TimeOfDay> remindersList = List.filled(
    1,
    const TimeOfDay(hour: 16, minute: 00),
    growable: true,
  );
  if (frequency != 'once_daily'.tr()) {
    remindersList[0] = const TimeOfDay(hour: 10, minute: 00);
    if (frequency == 'twice_daily'.tr()) {
      remindersList.add(const TimeOfDay(hour: 22, minute: 00));
    } else {
      remindersList.add(const TimeOfDay(hour: 14, minute: 00));
      remindersList.add(const TimeOfDay(hour: 19, minute: 00));
      if (frequency == 'every_6_hours'.tr()) {
        remindersList.add(const TimeOfDay(hour: 23, minute: 00));
      }
    }
  }
  return remindersList;
}
