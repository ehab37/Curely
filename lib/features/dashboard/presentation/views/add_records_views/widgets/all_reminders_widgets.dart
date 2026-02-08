import 'package:curely/core/helper_functions/pick_time.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'custom_icon_button_row.dart';

class AllRemindersWidgets extends StatefulWidget {
  const AllRemindersWidgets({super.key, required this.remindersList});

  final List<TimeOfDay> remindersList;

  @override
  State<AllRemindersWidgets> createState() => _AllRemindersWidgetsState();
}

class _AllRemindersWidgetsState extends State<AllRemindersWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        4.verticalSpacing,
        Text('Reminder Time', style: Styles.style16),
        CustomIconButtonRow(
          text1: widget.remindersList.length == 1
              ? 'Reminder Time: '
              : 'First Reminder Time: ',
          text2: widget.remindersList[0].format(context),
          icon: Icons.timer_outlined,
          onPressed: () async {
            widget.remindersList[0] =
                await selectTime(context) ?? widget.remindersList[0];
            setState(() {});
          },
        ),
        widget.remindersList.length == 1
            ? SizedBox.shrink()
            : Column(
                children: [
                  CustomIconButtonRow(
                    text1: 'Second Reminder Time: ',
                    text2: widget.remindersList[1].format(context),
                    icon: Icons.timer_outlined,
                    onPressed: () async {
                      widget.remindersList[1] =
                          await selectTime(context) ?? widget.remindersList[1];
                      setState(() {});
                    },
                  ),
                  widget.remindersList.length == 2
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            CustomIconButtonRow(
                              text1: 'Third Reminder Time: ',
                              text2: widget.remindersList[2].format(context),
                              icon: Icons.timer_outlined,
                              onPressed: () async {
                                widget.remindersList[2] =
                                    await selectTime(context) ??
                                    widget.remindersList[2];
                                setState(() {});
                              },
                            ),
                            widget.remindersList.length == 3
                                ? SizedBox.shrink()
                                : CustomIconButtonRow(
                                    text1: 'Forth Reminder Time: ',
                                    text2: widget.remindersList[3].format(
                                      context,
                                    ),
                                    icon: Icons.timer_outlined,
                                    onPressed: () async {
                                      widget.remindersList[3] =
                                          await selectTime(context) ??
                                          widget.remindersList[3];
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
