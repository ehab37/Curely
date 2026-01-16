import 'package:curely/constants.dart';
import 'package:flutter/material.dart';
import 'all_reminders_widgets.dart';
import 'switch_header_row.dart';

class ReminderToggleSwitch extends StatefulWidget {
  final bool isReminderEnabled;
  final ValueChanged<bool> onChangedToggle;
  final List<TimeOfDay> remindersList;

  const ReminderToggleSwitch({
    super.key,
    required this.isReminderEnabled,
    required this.onChangedToggle,
    required this.remindersList,
  });

  @override
  State<ReminderToggleSwitch> createState() => _ReminderToggleSwitchState();
}

class _ReminderToggleSwitchState extends State<ReminderToggleSwitch> {
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
          SwitchHeaderRow(
            isReminderEnabled: widget.isReminderEnabled,
            onChangedToggle: widget.onChangedToggle,
          ),
          AnimatedOpacity(
            duration: kTransitionDuration,
            opacity: widget.isReminderEnabled ? 1.0 : 0.0,
            child: widget.isReminderEnabled
                ? AllRemindersWidgets(remindersList: widget.remindersList)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
