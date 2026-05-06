import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? icon;
  final VoidCallback? onActionPressed;

  const CustomEmptyWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.icon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AssetsConstants.kAddFile,
                fit: BoxFit.scaleDown,
                height: 100,
              ),
            ),
            24.verticalSpacing,
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            12.verticalSpacing,
            Text(
              subTitle ?? '',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            32.verticalSpacing,
            if (onActionPressed != null)
              ElevatedButton.icon(
                onPressed: onActionPressed,
                icon: const Icon(Icons.add),
                label: Text(
                  context.tr("add_new_record"),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.onSecondaryContainer,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
