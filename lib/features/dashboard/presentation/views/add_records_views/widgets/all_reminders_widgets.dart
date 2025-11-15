import 'package:curely/core/helper_functions/pick_time.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custom_icon_button_row.dart';

class AllRemindersWidgets extends StatefulWidget {
  const AllRemindersWidgets({
    super.key,
    required this.onChangedReminders,
    required this.reminders,
  });

  final ValueChanged<List<TimeOfDay?>> onChangedReminders;
  final String reminders;

  @override
  State<AllRemindersWidgets> createState() => _AllRemindersWidgetsState();
}

class _AllRemindersWidgetsState extends State<AllRemindersWidgets> {
  TimeOfDay firstReminderTime = TimeOfDay(hour: 10, minute: 00);
  TimeOfDay secondReminderTime = TimeOfDay(hour: 14, minute: 00);
  TimeOfDay thirdReminderTime = TimeOfDay(hour: 19, minute: 00);
  TimeOfDay forthReminderTime = TimeOfDay(hour: 23, minute: 00);
  List<TimeOfDay?> remindersList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 4.0),
        Text('Reminder Time', style: Styles.style16),
        CustomIconButtonRow(
          text1: widget.reminders == 'Once Daily'
              ? 'Reminder Time: '
              : 'First Reminder Time: ',
          text2: firstReminderTime.format(context),
          icon: Icons.timer_outlined,
          onPressed: () async {
            firstReminderTime = await selectTime(context) ?? firstReminderTime;
            remindersList[0] = firstReminderTime;
            widget.onChangedReminders(remindersList);
            setState(() {});
          },
        ),
        widget.reminders == 'Once Daily'
            ? SizedBox.shrink()
            : Column(
                children: [
                  CustomIconButtonRow(
                    text1: 'Second Reminder Time: ',
                    text2: secondReminderTime.format(context),
                    icon: Icons.timer_outlined,
                    onPressed: () async {
                      secondReminderTime =
                          await selectTime(context) ?? secondReminderTime;
                      remindersList[1] = secondReminderTime;
                      widget.onChangedReminders(remindersList);
                      setState(() {});
                    },
                  ),
                  widget.reminders == 'Twice Daily'
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            CustomIconButtonRow(
                              text1: 'Third Reminder Time: ',
                              text2: thirdReminderTime.format(context),
                              icon: Icons.timer_outlined,
                              onPressed: () async {
                                thirdReminderTime =
                                    await selectTime(context) ??
                                    thirdReminderTime;
                                remindersList[2] = thirdReminderTime;
                                widget.onChangedReminders(remindersList);
                                setState(() {});
                              },
                            ),
                            widget.reminders == 'Every 8 Hours'
                                ? SizedBox.shrink()
                                : CustomIconButtonRow(
                                    text1: 'Forth Reminder Time: ',
                                    text2: forthReminderTime.format(context),
                                    icon: Icons.timer_outlined,
                                    onPressed: () async {
                                      forthReminderTime =
                                          await selectTime(context) ??
                                          forthReminderTime;
                                      remindersList[3] = forthReminderTime;
                                      widget.onChangedReminders(remindersList);
                                      setState(() {});
                                    },
                                  ),
                          ],
                        ),
                ],
              ),
      ],
    );
  }
}
