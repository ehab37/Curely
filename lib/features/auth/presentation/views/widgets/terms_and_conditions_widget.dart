import 'package:curely/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'custom_check_box.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
    required this.onChanged,
    required this.isChecked,
    required this.onTermsPressed,
  });

  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTermsPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            onChanged(value);
          },
          isChecked: isChecked,
        ),
        16.horizontalSpacing,
        Expanded(
          child: Text.rich(
            TextSpan(
              text: context.tr("i_agree_to_the"),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: onTermsPressed,
                    child: Text(
                      context.tr("terms_and_conditions"),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
