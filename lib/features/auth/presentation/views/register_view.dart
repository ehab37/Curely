import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:curely/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: RegisterViewBody(),
      ),
    );
  }
}
