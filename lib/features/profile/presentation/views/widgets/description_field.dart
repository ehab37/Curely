import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    required this.descriptionController,
    required this.isEditable,
  });

  final TextEditingController descriptionController;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: descriptionController,
      label: context.tr('description'),
      validator: (value) => AppValidators.validateRequired(value),
      enabled: isEditable,
      maxLines: 8,
    );
  }
}
