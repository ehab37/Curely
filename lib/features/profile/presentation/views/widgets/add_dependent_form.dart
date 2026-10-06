import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/features/profile/domain/entities/dependent_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_dependents_cubit/manage_dependents_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddDependentForm extends StatefulWidget {
  final DependentEntity? dependent;

  const AddDependentForm({super.key, this.dependent});

  @override
  State<AddDependentForm> createState() => _AddDependentFormState();
}

class _AddDependentFormState extends State<AddDependentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  String? _relationship;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.dependent?.name);
    _relationship = widget.dependent?.relationship;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: widget.dependent != null
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.dependent != null
                            ? context.tr("edit_your_details")
                            : context.tr("add_profile"),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      widget.dependent != null
                          ? InkWell(
                              onTap: () {
                                showAlertDialog(
                                  context: context,
                                  content: CustomAlertDialog(
                                    dialogContext: context,
                                    title: context.tr("delete_profile_title"),
                                    content: context.tr(
                                      "delete_profile_content",
                                      args: [widget.dependent!.name],
                                    ),
                                    onDone: () {
                                      context
                                          .read<ManageDependentsCubit>()
                                          .deleteDependent(
                                            dependent: widget.dependent!,
                                          );
                                      GoRouter.of(context).pop(true);
                                      GoRouter.of(context).pop();
                                    },
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: AppColors.error,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                20.verticalSpacing,
                CustomTextFormField(
                  controller: _nameController,
                  label: context.tr("profile_name"),
                  hint: context.tr("enter_profile_name"),
                  validator: (value) => AppValidators.validateRequired(value),
                ),
                8.verticalSpacing,
                CustomDropdownSearch(
                  hint: context.tr("select_relationship"),
                  label: context.tr("relationship"),
                  list: relationshipsList.map((e) => context.tr(e)).toList(),
                  onChanged: (localizedValue) {
                    _relationship = relationshipsList.firstWhere(
                      (englishKey) => englishKey.tr() == localizedValue,
                      orElse: () => context.tr('other'),
                    );
                  },
                  validator: (value) => AppValidators.validateRequired(value),
                ),
                20.verticalSpacing,
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final dependent = DependentEntity(
                        docId: widget.dependent?.docId,
                        name: _nameController.text,
                        relationship: _relationship!,
                      );

                      widget.dependent != null
                          ? context
                                .read<ManageDependentsCubit>()
                                .updateDependent(dependent: dependent)
                          : context.read<ManageDependentsCubit>().addDependent(
                              dependent: dependent,
                            );
                    }
                    GoRouter.of(context).pop();
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    context.tr("save"),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
