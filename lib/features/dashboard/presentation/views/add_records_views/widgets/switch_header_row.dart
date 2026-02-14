import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
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
              color: isReminderEnabled ? AppColors.primary : AppColors.unActive,
              size: 28,
            ),
            12.horizontalSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Set Reminder', style: Styles.style16),
                Text(
                  isReminderEnabled ? 'Reminders are ON' : 'Reminders are OFF',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isReminderEnabled
                        ? AppColors.brightBlue
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
          activeThumbColor: AppColors.primary,
          inactiveThumbColor: AppColors.unActive,
          inactiveTrackColor: AppColors.gray200,
          activeTrackColor: AppColors.primary.withAlpha(110),
        ),
      ],
    );
  }
}
