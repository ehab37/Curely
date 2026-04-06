import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/helpers/extensions.dart';
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
              color: isReminderEnabled
                  ? Theme.of(context).primaryColor
                  : AppColors.unActive,
              size: 28,
            ),
            12.horizontalSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set Reminder',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  isReminderEnabled ? 'Reminders are ON' : 'Reminders are OFF',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isReminderEnabled
                        ? Theme.of(context).colorScheme.onSecondary
                        : AppColors.unActive,
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
        ),
      ],
    );
  }
}
