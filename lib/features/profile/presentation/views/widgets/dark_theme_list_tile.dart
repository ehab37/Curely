import 'package:curely/core/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeListTile extends StatelessWidget {
  const DarkModeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return ListTile(
          leading: Icon(
            state == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
          ),
          title: Text(
            context.tr("dark_mode"),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Switch(
            value: state == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        );
      },
    );
  }
}
