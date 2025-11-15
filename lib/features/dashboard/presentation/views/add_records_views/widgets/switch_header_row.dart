import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SwitchHeaderRow extends StatelessWidget {
  const SwitchHeaderRow({
    super.key,
    required this.isReminderEnabled,
    required this.onChangedToggle,
  });

  final bool isReminderEnabled;
  final ValueChanged<bool> onChangedToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              isReminderEnabled
                  ? Icons.notifications_active
                  : Icons.notifications_off,
              color: isReminderEnabled ? kNavyColor : kGrayColor,
              size: 28,
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Set Reminder', style: Styles.style16),
                Text(
                  isReminderEnabled ? 'Reminders are ON' : 'Reminders are OFF',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isReminderEnabled ? kBrightBlueColor : kGrayColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        Switch.adaptive(
          // Use .adaptive for native look on iOS/Android
          value: isReminderEnabled,
          onChanged: onChangedToggle,
          activeColor: kNavyColor,
          inactiveThumbColor: kGrayColor,
          inactiveTrackColor: Colors.grey.shade200,
          activeTrackColor: kNavyColor.withAlpha(110),
        ),
      ],
    );
  }
}
