import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class AppTextFormFiled extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Widget? prefixIcon;
  final Widget? icon;

  const AppTextFormFiled({super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.prefixIcon,
    this.icon,
    required this.validator,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        focusedBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.3,
            )
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.3,
            )
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        // hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsApp.moreLightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      // style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}