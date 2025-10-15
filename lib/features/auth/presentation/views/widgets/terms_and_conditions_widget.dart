import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
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
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'I agree to the ',
              style: Styles.style15.copyWith(
                color: kDarkGrayColor.withAlpha(160),
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: onTermsPressed,
                    child: const Text(
                      'Terms and Conditions',
                      style: Styles.styleUnderline16,
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
