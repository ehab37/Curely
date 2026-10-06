import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/profile/presentation/cubits/manage_dependents_cubit/manage_dependents_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_dependent_form.dart';
import 'dependent_item.dart';

class ManageDependentsViewBody extends StatelessWidget {
  const ManageDependentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageDependentsCubit, ManageDependentsState>(
      listener: (context, state) {
        if (state is AddDependentSuccess) {
          InfoBox.successFloatingBox(context, context.tr("added_successfully"));
        } else if (state is UpdateDependentSuccess) {
          InfoBox.successFloatingBox(
            context,
            context.tr("updated_successfully"),
          );
        } else if (state is DeleteDependentSuccess) {
          InfoBox.successFloatingBox(
            context,
            context.tr("deleted_successfully"),
          );
        } else if (state is AddDependentFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is UpdateDependentFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeleteDependentFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is ManageDependentsLoading) {
          return const CustomLoadingIndicator();
        } else if (state is GetDependentsFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () =>
                context.read<ManageDependentsCubit>().getDependents(),
          );
        } else if (state is GetDependentsSuccess) {
          return Column(
            children: [
              16.verticalSpacing,
              Expanded(
                child: state.dependents.isEmpty
                    ? CustomEmptyWidget(
                        title: context.tr("no_family_profiles_added_yet"),
                      )
                    : ListView.builder(
                        itemCount: state.dependents.length,
                        itemBuilder: (context, index) {
                          return DependentItem(
                            dependent: state.dependents[index],
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomButton(
                  onPressed: () {
                    showCustomBottomSheet(
                      context,
                      BlocProvider.value(
                        value: context.read<ManageDependentsCubit>(),
                        child: const AddDependentForm(),
                      ),
                    );
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    context.tr("add_profile"),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
