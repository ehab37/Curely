import 'package:curely/core/helper_functions/border_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.hint,
    required this.list,
    required this.onChanged,
  });

  final String hint;
  final List<DropdownMenuItem> list;
  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      menuMaxHeight: MediaQuery.of(context).size.height / 2,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: customBorder(),
        border: customBorder(),
        focusedBorder: customBorder(),
      ),
      hint: Text(hint, style: Styles.style16),
      items: list,
      onChanged: onChanged,
    );
  }
}
