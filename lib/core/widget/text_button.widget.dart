
import 'package:booking_application/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;

  const AppTextButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? ColorsApp.mainBlue,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: textStyle,
          ),
          if (icon != null) ...[
            SizedBox(width: 8.w),
            CircleAvatar(
              backgroundColor: ColorsApp.white,
              child: Icon(
                icon,
                size: (textStyle?.fontSize ?? 16).sp,
                color: Colors.orange,
              ),
            ),
          ],
        ],
      ),
    );
  }
}