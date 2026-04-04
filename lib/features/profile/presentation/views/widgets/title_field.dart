import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  const TitleField({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: titleController,
      label: 'Title',
      enabled: false,
    );
  }
}
