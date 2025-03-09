import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/colors.dart';
import 'core/theming/font_weight_helper.dart';
import 'core/theming/styles.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile Screen',
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
