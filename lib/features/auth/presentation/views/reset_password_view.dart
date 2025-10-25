import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:curely/features/auth/presentation/views/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(authRepo: getIt<AuthRepo>()),
        child: ResetPasswordViewBody(),
      ),
    );
  }
}
