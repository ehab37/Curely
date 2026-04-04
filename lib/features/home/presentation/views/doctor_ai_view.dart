import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:curely/features/home/presentation/cubits/doctor_ai_cubit/doctor_ai_cubit.dart';
import 'package:curely/features/home/presentation/views/widgets/doctor_ai_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/doctor_ai_app_bar.dart';

class DoctorAiView extends StatelessWidget {
  const DoctorAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorAiCubit(homeRepo: getIt<HomeRepo>()),
      child: Scaffold(
        appBar: buildDoctorAiAppBar(context),
        body: DoctorAiViewBody(),
      ),
    );
  }
}
