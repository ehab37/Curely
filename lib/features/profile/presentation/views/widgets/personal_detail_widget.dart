import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/domain/entities/personal_details_entity.dart';
import 'package:curely/features/profile/presentation/views/widgets/icon_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PersonalDetailWidget extends StatelessWidget {
  const PersonalDetailWidget({super.key, required this.personalDetailsEntity});

  final PersonalDetailsEntity personalDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
      ),
      child: Row(
        children: [
          IconBox(icon: personalDetailsEntity.icon),
          9.horizontalSpacing,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.tr(personalDetailsEntity.title),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  personalDetailsEntity.subTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
