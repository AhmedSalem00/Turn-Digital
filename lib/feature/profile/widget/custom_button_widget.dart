import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            label: Row(
              children: [
                Icon(Icons.person_add, color: ColorsApp.white),
                SizedBox(width: 8.w),
                Text("Follow", style: TextStyles.font15GrayRegular.copyWith(color: ColorsApp.white)),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: ColorsApp.orange,
              side: BorderSide(color: ColorsApp.orange),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Row(
              children: [
                Icon(Icons.message, color: ColorsApp.orange, size: 20),
                SizedBox(width: 8.w),

                Text("Messages", style: TextStyles.font15GrayRegular.copyWith(color:ColorsApp.orange)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
