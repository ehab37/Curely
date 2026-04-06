import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error, this.onTryAgain});

  final String error;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsConstants.kNotify,
            fit: BoxFit.scaleDown,
            height: 160,
          ),
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
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: onTryAgain!,
                child: Text(
                  "Please try again",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
