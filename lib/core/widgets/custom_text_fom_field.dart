import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/helper_functions/border_functions.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final bool isSecure;
  final void Function(String)? onSubmit;
  final IconData? suffixIcon;
  final void Function()? suffixPress;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autoFocus;

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
  });

  @override
  Widget build(BuildContext context) {
    final isArabic =
        CacheHelper.getData(key: CacheConstants.kIsArabic) ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorHeight: 18,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator,
        controller: controller,
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          fillColor: AppColors.background,
          filled: true,
          contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: 0,
            horizontal: 12,
          ),
          hintText: hint,
          labelText: label,
          labelStyle: Styles.style15,
          enabledBorder: customBorder(),
          disabledBorder: customBorder(),
          border: customBorder(),
          focusedBorder: customBorder(),
          prefixIconConstraints: BoxConstraints(minWidth: 40),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: isArabic ? 8.0 : 0,
                    left: isArabic ? 0 : 8,
                  ),
                  child: Icon(prefixIcon, color: AppColors.primary),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: suffixPress,
                  color: AppColors.primary,
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
