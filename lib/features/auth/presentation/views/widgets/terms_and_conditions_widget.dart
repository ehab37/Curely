import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:curely/generated/l10n.dart';
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
              text: S.of(context).iAgreeToThe,
              style: Styles.style15.copyWith(
                color: AppColors.darkGray.withAlpha(160),
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: onTermsPressed,
                    child: Text(
                      S.of(context).termsAndConditions,
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
