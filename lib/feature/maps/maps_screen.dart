import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Maps Screen',
          style: TextStyles.font12OrangeRegular.copyWith(
            color: ColorsApp.black,
            fontSize: 30.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),
    );
  }
}
