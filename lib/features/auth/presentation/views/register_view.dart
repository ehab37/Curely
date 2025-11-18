import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:curely/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  // CacheHelper.putBoolData(key: kIsUserLogin, value: true);
                } else if (state is RegisterFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return CustomProgressHud(
                  isLoading: state is RegisterLoading ? true : false,
                  child: RegisterViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
