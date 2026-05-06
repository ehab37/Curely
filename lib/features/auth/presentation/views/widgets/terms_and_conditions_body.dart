import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_check_box.dart';
import 'terms_details.dart';

class TermsAndConditionsBody extends StatelessWidget {
  const TermsAndConditionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isAccepted = ValueNotifier<bool>(false);
    return Padding(
      padding: const EdgeInsets.all(SpacingConstants.horizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderLight),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surface,
              ),
              padding: const EdgeInsets.all(15.0),
              child: const SingleChildScrollView(child: TermsDetails()),
            ),
          ),
          15.verticalSpacing,
          ValueListenableBuilder<bool>(
            valueListenable: isAccepted,
            builder: (context, accepted, child) {
              return Row(
                children: [
                  CustomCheckBox(
                    onChecked: (value) {
                      isAccepted.value = value;
                    },
                    isChecked: accepted,
                  ),
                  16.horizontalSpacing,
                  Expanded(
                    child: Text(
                      context.tr('i_agree_terms_body'),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            },
          ),
          20.verticalSpacing,
          ValueListenableBuilder<bool>(
            valueListenable: isAccepted,
            builder: (context, accepted, child) {
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: accepted
                      ? () {
                          GoRouter.of(context).pop(true);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    context.tr('accept_and_continue'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
