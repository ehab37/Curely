import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/records_dismissible_widget.dart';
import 'package:curely/features/profile/domain/entities/dependent_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_dependents_cubit/manage_dependents_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_dependent_form.dart';

class DependentItem extends StatelessWidget {
  final DependentEntity dependent;

  const DependentItem({super.key, required this.dependent});

  @override
  Widget build(BuildContext context) {
    return RecordsDismissibleWidget(
      recordKey: dependent.docId!,
      onDismissed: (direction) {
        context.read<ManageDependentsCubit>().deleteDependent(
          dependent: dependent,
        );
      },
      title: context.tr("delete_profile_title"),
      supTitle: context.tr("delete_profile_content", args: [dependent.name]),
      content: Card(
        child: ListTile(
          contentPadding: EdgeInsetsDirectional.only(start: 16, end: 8),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              dependent.name[0].toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          title: Text(
            dependent.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            context.tr(dependent.relationship),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              showCustomBottomSheet(
                context,
                BlocProvider.value(
                  value: context.read<ManageDependentsCubit>(),
                  child: AddDependentForm(dependent: dependent),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: AppColors.transparent,
              child: Icon(Icons.edit_outlined, color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
