import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/border_functions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch extends StatelessWidget {
  const CustomDropdownSearch({
    super.key,
    this.dropDownKey,
    this.selectedItem,
    required this.hint,
    required this.label,
    required this.list,
    required this.onChanged,
    required this.validator,
    this.showSearchBox = true,
  });

  final GlobalKey<DropdownSearchState<String>>? dropDownKey;
  final String? selectedItem;
  final String hint;
  final String label;
  final List<String> list;
  final void Function(dynamic) onChanged;
  final String? Function(dynamic) validator;
  final bool showSearchBox;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      key: dropDownKey,
      selectedItem: selectedItem,
      validator: validator,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelText: label,
          hintText: hint,
          enabledBorder: customBorder(context),
          border: customBorder(context),
          focusedBorder: customBorder(context),
        ),
      ),
      popupProps: PopupProps.menu(
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.onPrimary.withAlpha(200),
        ),
        fit: FlexFit.loose,
        showSearchBox: showSearchBox,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary,
            enabledBorder: customBorder(context),
            border: customBorder(context),
            focusedBorder: customBorder(context),
            hintText: "Type to filter items...",
            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      items: (filter, infiniteScrollProps) => list,
      onChanged: onChanged,
    );
  }
}
