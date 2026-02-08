import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error, this.onTryAgain});

  final String error;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (MediaQuery.of(context).size.height / 4).verticalSpacing,
          Icon(Icons.error_outline, color: AppColors.error, size: 80),
          16.verticalSpacing,
          Text(
            error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          16.verticalSpacing,
          if (onTryAgain != null)
            SizedBox(
              width: 200, // Limit button width
              child: CustomButton(
                backgroundColor: AppColors.primary,
                onPressed: onTryAgain!,
                child: Text("Please try again.", style: Styles.style18),
              ),
            ),
        ],
      ),
    );
  }
}
