import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/border_functions.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
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
          fillColor: AppColors.background,
          labelStyle: Styles.style16,
          hintStyle: Styles.style15,
          labelText: label,
          hintText: hint,
          enabledBorder: customBorder(),
          border: customBorder(),
          focusedBorder: customBorder(),
        ),
      ),
      popupProps: PopupProps.menu(
        // itemBuilder: (context, item, isSelected,isSelected2) {
        //   return Container(
        //     // Custom styling for the entire row
        //     color: isSelected ? AppColors.blue.withOpacity(0.1) : AppColors.background,
        //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        //
        //     child: Text(
        //       item,
        //       style: TextStyle(
        //         fontSize: 18,
        //         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        //         color: isSelected ? AppColors.primary : Colors.black87,
        //       ),
        //     ),
        //   );
        // },
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
          backgroundColor: AppColors.offWhite.withAlpha(200),
        ),
        fit: FlexFit.loose,
        showSearchBox: showSearchBox,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.background,
            enabledBorder: customBorder(),
            border: customBorder(),
            focusedBorder: customBorder(),
            hintText: "Type to filter items...",
            hintStyle: Styles.style16,
          ),
        ),
      ),
      items: (filter, infiniteScrollProps) => list,
      onChanged: onChanged,
    );
  }
}
