import 'package:flutter/material.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/core/constants/text_styles.dart';


class ExpandedTextField extends StatelessWidget {
  const ExpandedTextField({
    Key? key,
    this.controller,
    this.fillColor = AppColors.white,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
    this.hintText,
    this.prefixIcon,

  }) : super(key: key);
  final TextEditingController? controller;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      onChanged: onChanged,
      expands: true,
      maxLines: null,
      minLines: null,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      cursorColor: AppColors.gray500,
      //   style: bodyMedium14.copyWith(color: AppColors.gray500),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor:
        MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.gray500 : AppColors.gray200),
        suffixIconColor:
        MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.gray500 : AppColors.gray200),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyle.bodyMedium,
        //  hintStyle: bodyMedium14.copyWith(color: AppColors.gray200),
        contentPadding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gray100, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gray500, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const   BorderSide(   width: 0,
            style: BorderStyle.none,),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red300, width: 1.0),
        ),
      ),
    );
  }
}
