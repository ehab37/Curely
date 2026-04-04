import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/presentation/views/widgets/icon_box.dart';
import 'package:flutter/material.dart';

class PersonalDetailWidget extends StatelessWidget {
  const PersonalDetailWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
          borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
        ),
        child: Row(
          children: [
            IconBox(icon: icon),
            12.horizontalSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
