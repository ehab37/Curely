import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class ProfileIconAndName extends StatelessWidget {
  const ProfileIconAndName({
    super.key,
    required this.isActive,
    required this.profileName,
    this.isAddButton = false,
  });

  final bool isActive;
  final String profileName;
  final bool isAddButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
              border: isActive
                  ? Border.all(color: Theme.of(context).primaryColor, width: 4)
                  : null,
            ),
            child: Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
                border: isActive
                    ? Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1,
                      )
                    : null,
              ),
              child: isAddButton
                  ? Icon(Icons.add)
                  : Text(
                      profileName[0].toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
            ),
          ),
          2.verticalSpacing,
          Text(profileName, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
