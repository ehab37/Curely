import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'icon_box.dart';
import 'update_user_details.dart';

class NameAndGmailSection extends StatelessWidget {
  const NameAndGmailSection({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          final cubit = context.read<ManageProfileCubit>();
          showCustomBottomSheet(
            context,
            BlocProvider.value(
              value: cubit,
              child: UpdateUserDetails(user: user),
            ),
          );
        },
        child: IconBox(icon: Icons.edit),
      ),
      title: Text(
        user.name,
        style: Theme.of(context).textTheme.headlineMedium,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        user.email,
        style: Theme.of(context).textTheme.displayLarge,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
