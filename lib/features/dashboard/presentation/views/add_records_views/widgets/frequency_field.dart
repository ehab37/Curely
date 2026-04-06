import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:flutter/material.dart';

class FrequencyField extends StatelessWidget {
  const FrequencyField({super.key, required this.onChanged});

  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownSearch(
      hint: 'How Often?',
      label: "Frequency",
      showSearchBox: false,
      list: frequencyList,
      onChanged: onChanged,
      validator: (value) => AppValidators.validateRequired(value),
    );
  }
}
