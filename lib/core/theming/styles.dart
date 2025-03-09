import 'package:booking_application/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle get font18BlackMedium => GoogleFonts.urbanist(

    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.black,
  );
  static TextStyle get font14BlueRegular => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.bLUE,
  );

  static TextStyle get font18BlackRegular => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.black,
  );
  static TextStyle get font14GrayRegular => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.gray,
  );

  static TextStyle get font15GrayRegular => GoogleFonts.urbanist(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.black,
  );
  static TextStyle get font18GrayMedium => GoogleFonts.urbanist(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.black,
  );

  static TextStyle get font24GrayRegular => GoogleFonts.urbanist(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.black,
  );

  static TextStyle get font20WhiteRegular => GoogleFonts.urbanist(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.white,
  );
  static TextStyle get font19BlackMedium => GoogleFonts.urbanist(
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.black,
  );


  static TextStyle get font12OrangeRegular => GoogleFonts.urbanist(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.orange,
  );


}
