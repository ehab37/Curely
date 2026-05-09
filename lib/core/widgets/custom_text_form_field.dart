import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/helpers/border_functions.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final bool isSecure;
  final void Function(String)? onSubmit;
  final FaIconData? suffixIcon;
  final void Function()? suffixPress;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autoFocus;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.keyboard,
    this.validator,
    this.hint,
    required this.label,
    this.prefixIcon,
    this.isSecure = false,
    this.onSubmit,
    this.suffixIcon,
    this.suffixPress,
    this.maxLines,
    this.textCapitalization,
    this.inputFormatters,
    this.autoFocus,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic =
        CacheHelper.getData(key: CacheConstants.kIsArabic) ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: !enabled,
        cursorHeight: 18,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator,
        controller: controller,
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          errorMaxLines: 8,
          isDense: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          filled: true,
          contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          hintText: hint,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          enabledBorder: customBorder(context),
          disabledBorder: customBorder(context),
          border: customBorder(context),
          focusedBorder: customBorder(context),
          prefixIconConstraints: BoxConstraints(minWidth: 40),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: isArabic ? 8.0 : 0,
                    left: isArabic ? 0 : 8,
                  ),
                  child: Icon(
                    prefixIcon,
                    color: Theme.of(context).iconTheme.color,
                  ),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: FaIcon(suffixIcon),
                  onPressed: suffixPress,
                  color: Theme.of(context).iconTheme.color,
                )
              : null,
        ),
        keyboardType: keyboard,
        onFieldSubmitted: onSubmit,
        obscureText: isSecure,
        maxLines: maxLines ?? 1,
      ),
    );
  }
}
