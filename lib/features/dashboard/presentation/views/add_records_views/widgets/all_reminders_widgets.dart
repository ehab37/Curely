import 'package:curely/core/helpers/pick_time.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
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
        Text(
          context.tr('reminder_time'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        CustomIconButtonRow(
          text1: widget.remindersList.length == 1
              ? '${context.tr('reminder_time')}: '
              : context.tr('first_reminder_time'),
          text2: widget.remindersList[0].format(context),
          icon: Icons.timer_outlined,
          onPressed: () async {
            widget.remindersList[0] =
                await selectTime(context) ?? widget.remindersList[0];
            setState(() {});
          },
        ),
        widget.remindersList.length == 1
            ? const SizedBox.shrink()
            : Column(
                children: [
                  CustomIconButtonRow(
                    text1: context.tr('second_reminder_time'),
                    text2: widget.remindersList[1].format(context),
                    icon: Icons.timer_outlined,
                    onPressed: () async {
                      widget.remindersList[1] =
                          await selectTime(context) ?? widget.remindersList[1];
                      setState(() {});
                    },
                  ),
                  widget.remindersList.length == 2
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            CustomIconButtonRow(
                              text1: context.tr('third_reminder_time'),
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
                                ? const SizedBox.shrink()
                                : CustomIconButtonRow(
                                    text1: context.tr('forth_reminder_time'),
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
