import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/image_input/profile_cached_image_widget.dart';
import 'package:flutter/material.dart';

AppBar buildHomeAppBar(BuildContext context) {
  final UserEntity user = getIt<UserDataRepo>().getUserDataLocally();
  return AppBar(
    elevation: 5,
    shadowColor: Theme.of(context).colorScheme.shadow,
    toolbarHeight: 70,
    backgroundColor: Theme.of(context).primaryColor,
    leading: DrawerButton(
      color: Theme.of(context).colorScheme.onPrimary,
      style: ButtonStyle(iconSize: WidgetStatePropertyAll(40)),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ProfileCachedImageWidget(
          imageUrl: user.imageUrl,
          isProfile: false,
        ),
      ),
    ],
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello", style: Theme.of(context).textTheme.displayLarge),
        5.verticalSpacing,
        Text(user.name, style: Theme.of(context).textTheme.headlineMedium),
      ],
    ),
  );
}
