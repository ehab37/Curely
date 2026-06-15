import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/border_functions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch extends StatefulWidget {
  const CustomDropdownSearch({
    super.key,
    required this.hint,
    required this.label,
    required this.list,
    required this.onChanged,
    required this.validator,
    this.showSearchBox = true,
  });

  final String hint;
  final String label;
  final List<String> list;
  final void Function(String?) onChanged;
  final String? Function(dynamic) validator;
  final bool showSearchBox;

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  final valueListenable = ValueNotifier<String?>(null);
  final iconNotifier = ValueNotifier<bool>(false);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      iconStyleData: IconStyleData(
        icon: ValueListenableBuilder(
          valueListenable: iconNotifier,
          builder: (context, value, child) => AnimatedRotation(
            turns: value ? -0.5 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ),
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelText: widget.label,
        hintText: widget.hint,
        enabledBorder: customBorder(context),
        border: customBorder(context),
        focusedBorder: customBorder(context),
      ),
      dropdownStyleData: DropdownStyleData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
        ),
        offset: Offset(0, -8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        maxHeight: 400,
      ),
      dropdownSearchData: !widget.showSearchBox
          ? null
          : DropdownSearchData(
              searchController: searchController,
              searchBarWidgetHeight: 50,
              searchBarWidget: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 12,
                  left: 12,
                  bottom: 8,
                ),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    enabledBorder: customBorder(context),
                    border: customBorder(context),
                    focusedBorder: customBorder(context),
                    hintText: context.tr("type_to_filter"),
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              noResultsWidget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No Items Match!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
      buttonStyleData: FormFieldButtonStyleData(
        height: 20,
        width: double.infinity,
      ),
      items: widget.list
          .map(
            (item) => DropdownItem(
              value: item,
              height: 35,
              child: Text(item, style: Theme.of(context).textTheme.bodyMedium),
            ),
          )
          .toList(),
      dropdownSeparator: DropdownSeparator(
        height: 2,
        child: Divider(
          color: Theme.of(context).primaryColor,
          thickness: .3,
          indent: 15,
          endIndent: 15,
        ),
      ),
      valueListenable: valueListenable,
      onChanged: (value) {
        valueListenable.value = value;
        widget.onChanged(value);
      },
      onMenuStateChange: (isOpen) {
        iconNotifier.value = isOpen;
        if (!isOpen) {
          searchController.clear();
        }
      },
    );
  }
}
