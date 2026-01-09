import 'package:flutter/material.dart';

List<TimeOfDay> getDefaultRemindersList(String frequency) {
  List<TimeOfDay> remindersList = List.filled(
    1,
    TimeOfDay(hour: 16, minute: 00),
    growable: true,
  );
  if (frequency != 'Once Daily') {
    remindersList[0] = TimeOfDay(hour: 10, minute: 00);
    if (frequency == 'Twice Daily') {
      remindersList.add(TimeOfDay(hour: 22, minute: 00));
    } else {
      remindersList.add(TimeOfDay(hour: 14, minute: 00));
      remindersList.add(TimeOfDay(hour: 19, minute: 00));
      if (frequency == 'Every 6 Hours') {
        remindersList.add(TimeOfDay(hour: 23, minute: 00));
      }
    }
  }
  return remindersList;
}
