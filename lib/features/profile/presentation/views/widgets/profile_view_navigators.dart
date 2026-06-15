import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
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
          const DarkModeListTile(),
          CustomNavBar(
            text: context.tr("my_health_notes"),
            prefixIcon: FontAwesomeIcons.notesMedical,
            suffixIcon: Icons.arrow_forward_ios,
            onPressed: () {
              GoRouter.of(context).push(AppRoutesConstants.kNotesView);
            },
          ),
          CustomNavBar(
            text: context.tr("language"),
            prefixIcon: FontAwesomeIcons.language,
            suffixIcon: Icons.arrow_forward_ios,
            onPressed: () {
              GoRouter.of(context).push(AppRoutesConstants.kLanguageView);
            },
          ),
          CustomNavBar(
            text: context.tr("delete_account"),
            prefixIcon: FontAwesomeIcons.trashCan,
            suffixIcon: Icons.arrow_forward_ios,
            onPressed: () {
              showAlertDialog(
                context: context,
                content: CustomAlertDialog(
                  dialogContext: context,
                  title: context.tr('delete_account_title'),
                  content: context.tr('delete_account_content'),
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
