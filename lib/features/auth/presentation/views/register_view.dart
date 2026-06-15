import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/register_view_body.dart';
import 'widgets/verification_alert_dialog.dart';

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
                  showAlertDialog(
                    context: context,
                    content: VerificationAlertDialog(),
                  );
                } else if (state is RegisterFailure) {
                  InfoBox.errorFloatingBox(context, state.errMessage);
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
