import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/border_functions.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboard;
  final String? Function(String?)? validation;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final bool isSecure;
  final void Function(String)? onSubmit;
  final IconData? suffixIcon;
  final void Function()? suffixPress;
  final int? maxLines;
  final TextCapitalization? textCapitalization;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.keyboard,
    this.validation,
    this.hint,
    required this.label,
    this.prefixIcon,
    this.isSecure = false,
    this.onSubmit,
    this.suffixIcon,
    this.suffixPress,
    this.maxLines,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = CacheHelper.getData(key: kIsArabic) ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validation,
        controller: controller,
        decoration: InputDecoration(
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
                  child: Icon(prefixIcon, color: kNavyColor),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: suffixPress,
                  color: kNavyColor,
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
