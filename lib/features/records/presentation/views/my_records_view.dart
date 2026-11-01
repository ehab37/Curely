import 'package:curely/core/global_cubits/active_profile_cubit/active_profile_cubit.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/records/presentation/views/widgets/my_records_view_body.dart';
import 'package:curely/features/profile/domain/repos/dependents_repo.dart';
import 'package:curely/features/profile/presentation/cubits/manage_dependents_cubit/manage_dependents_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyRecordsView extends StatelessWidget {
  const MyRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageDependentsCubit(
        dependentsRepo: getIt<DependentsRepo>(),
        activeProfileCubit: context.read<ActiveProfileCubit>(),
      )..getDependents(),
      child: Scaffold(
        appBar: buildCustomAppBar(
          title: context.tr("my_records"),
          icon: FontAwesomeIcons.houseMedical,
        ),
        body: const SafeArea(child: MyRecordsViewBody()),
      ),
    );
  }
}
