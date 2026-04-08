import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MedicineUsageField extends StatelessWidget {
  const MedicineUsageField({super.key, required this.onChanged});

  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownSearch(
      label: context.tr("medicine_usage"),
      hint: context.tr("enter_medicine_usage"),
      list: medicineUsagesList.map((e) => context.tr(e)).toList(),
      onChanged: onChanged,
      validator: (value) => AppValidators.validateRequired(value),
    );
  }
}
