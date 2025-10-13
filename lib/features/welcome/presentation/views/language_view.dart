import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:curely/features/welcome/presentation/cubits/selection_cubit.dart';
import 'package:curely/features/welcome/presentation/views/widgets/language_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final initialLocaleCode = context.read<LanguageCubit>().state.languageCode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => SelectionCubit(initialLocaleCode),
        child: LanguageViewBody(),
      ),
    );
  }
}
