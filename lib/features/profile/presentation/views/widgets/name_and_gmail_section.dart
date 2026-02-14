import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
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
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              final cubit = context.read<EditProfileCubit>();
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
        ],
      ),
      title: Text(
        user.name,
        style: Styles.style28.copyWith(color: AppColors.background),
      ),
      subtitle: Text(
        user.email,
        style: Styles.style18,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
