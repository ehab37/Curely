import 'package:curely/core/helper_functions/pick_time.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_icon_button_row.dart';

class AllRemindersWidgets extends StatelessWidget {
  const AllRemindersWidgets({
    super.key,
    required this.remindersList,
    required this.reminders,
  });

  final List<TimeOfDay> remindersList;
  final String reminders;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 4.0),
        Text('Reminder Time', style: Styles.style16),
        CustomIconButtonRow(
          text1: reminders == 'Once Daily'
              ? 'Reminder Time: '
              : 'First Reminder Time: ',
          text2: remindersList[0].format(context),
          icon: Icons.timer_outlined,
          onPressed: () async {
            remindersList[0] = await selectTime(context) ?? remindersList[0];
          },
        ),
        reminders == 'Once Daily'
            ? SizedBox.shrink()
            : Column(
                children: [
                  CustomIconButtonRow(
                    text1: 'Second Reminder Time: ',
                    text2: remindersList[1].format(context),
                    icon: Icons.timer_outlined,
                    onPressed: () async {
                      remindersList[1] =
                          await selectTime(context) ?? remindersList[1];
                    },
                  ),
                  reminders == 'Twice Daily'
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            CustomIconButtonRow(
                              text1: 'Third Reminder Time: ',
                              text2: remindersList[2].format(context),
                              icon: Icons.timer_outlined,
                              onPressed: () async {
                                remindersList[2] =
                                    await selectTime(context) ??
                                    remindersList[2];
                              },
                            ),
                            reminders == 'Every 8 Hours'
                                ? SizedBox.shrink()
                                : CustomIconButtonRow(
                                    text1: 'Forth Reminder Time: ',
                                    text2: remindersList[3].format(context),
                                    icon: Icons.timer_outlined,
                                    onPressed: () async {
                                      remindersList[3] =
                                          await selectTime(context) ??
                                          remindersList[3];
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
