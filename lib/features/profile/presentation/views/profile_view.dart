import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/profile/domain/repos/profile_repo.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CacheHelper.getData(key: AppTextConstants.kThemeKey);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme == AppTextConstants.dark
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ManageProfileCubit(
            profileRepo: getIt<ProfileRepo>(),
            imagesRepo: getIt<ImagesRepo>(),
            authRepo: getIt<AuthRepo>(),
          ),
          child: ProfileViewBody(),
        ),
      ),
    );
  }
}
