import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
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
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kLightGrayColor),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15.0),
              child: const SingleChildScrollView(
                child: TermsDetails(),
              ),
            ),
          ),
          const SizedBox(height: 15),
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'I have read and agree to the Terms and Conditions.',
                      style: Styles.style16,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
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
                    backgroundColor: kNavyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'I Accept and Continue',
                    style: Styles.style20,
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