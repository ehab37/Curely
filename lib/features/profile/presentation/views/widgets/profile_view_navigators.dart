import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dark_theme_list_tile.dart';

class ProfileViewNavigators extends StatelessWidget {
  const ProfileViewNavigators({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          DarkModeListTile(),
          CustomNavBar(
            text: "My Health Notes",
            prefixIcon: FontAwesomeIcons.notesMedical,
            suffixIcon: Icons.arrow_forward_ios,
            onPressed: () {
              GoRouter.of(context).push(AppRoutesConstants.kNotesView);
            },
          ),
          CustomNavBar(
            text: "Language",
            prefixIcon: Icons.language_outlined,
            suffixIcon: Icons.arrow_forward_ios,
            onPressed: () {
              GoRouter.of(context).push(AppRoutesConstants.kLanguageView);
            },
          ),
          CustomNavBar(
            text: "Delete Account",
            prefixIcon: Icons.delete_forever_outlined,
            suffixIcon: Icons.arrow_forward_ios,
            onPressed: () {
              showAlertDialog(
                context: context,
                content: CustomAlertDialog(
                  dialogContext: context,
                  title: 'Delete Account?',
                  content:
                      'Are you sure you want to delete your account and all your data?',
                  onDone: () {
                    context.read<ManageProfileCubit>().deleteAccount(
                      uId: user.uId,
                    );
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
