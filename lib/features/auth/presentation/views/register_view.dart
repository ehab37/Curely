import 'package:curely/core/helper_functions/snack_bar_function.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:curely/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
                  customSnackBar(context, "Success");
                } else if (state is RegisterFailure) {
                  customSnackBar(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is RegisterLoading ? true : false,
                  child: RegisterViewBody(),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
