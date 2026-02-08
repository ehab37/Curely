import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:curely/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutesConstants.kMainView);
                } else if (state is LoginFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return CustomProgressHud(
                  isLoading: state is LoginLoading ? true : false,
                  child: LoginViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
