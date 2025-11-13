import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/custom_icon_button_row.dart';
import 'package:flutter/material.dart';

class ReminderToggleSwitch extends StatefulWidget {
  final bool isReminderEnabled;
  final ValueChanged<bool> onChanged;

  const ReminderToggleSwitch({
    super.key,
    required this.isReminderEnabled,
    required this.onChanged,
  });

  @override
  State<ReminderToggleSwitch> createState() => _ReminderToggleSwitchState();
}

class _ReminderToggleSwitchState extends State<ReminderToggleSwitch> {
  TimeOfDay startReminderTime = TimeOfDay(hour: 10, minute: 00);

  Future<void> _selectTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 10, minute: 00);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        startReminderTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kTransitionDuration,
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    widget.isReminderEnabled
                        ? Icons.notifications_active
                        : Icons.notifications_off,
                    color: widget.isReminderEnabled ? kNavyColor : kGrayColor,
                    size: 28,
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Set Reminder', style: Styles.style16),
                      Text(
                        widget.isReminderEnabled
                            ? 'Reminders are ON'
                            : 'Reminders are OFF',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: widget.isReminderEnabled
                              ? kBrightBlueColor
                              : kGrayColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch.adaptive(
                // Use .adaptive for native look on iOS/Android
                value: widget.isReminderEnabled,
                onChanged: widget.onChanged,
                activeColor: kNavyColor,
                inactiveThumbColor: kGrayColor,
                inactiveTrackColor: Colors.grey.shade200,
                activeTrackColor: kNavyColor.withAlpha(110),
              ),
            ],
          ),
          AnimatedOpacity(
            duration: kTransitionDuration,
            opacity: widget.isReminderEnabled ? 1.0 : 0.0,
            child: widget.isReminderEnabled
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      const SizedBox(height: 4.0),
                      Text(
                        'Reminder Time',
                        style: Styles.style15.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomIconButtonRow(
                        text1: 'Starting Reminder Time: ',
                        text2: startReminderTime.format(context),
                        icon: Icons.timer_outlined,
                        onPressed: () async {
                          await _selectTime(context);
                        },
                      ),
                    ],
                  )
                : const SizedBox.shrink(), // Empty widget when collapsed
          ),
        ],
      ),
    );
  }
}
