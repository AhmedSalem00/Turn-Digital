import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/core/widget/text_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizeWidget extends StatelessWidget {
  final String organizerName;
  final String organizerPicture;

  const OrganizeWidget({
    super.key,
    required this.organizerName,
    required this.organizerPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(organizerPicture, height: 40.h, width: 40.w),
        SizedBox(width: 10.w),
        Text(organizerName, style: TextStyles.font15GrayRegular),
        Spacer(),
        SizedBox(
          width: 65.w,
          child: AppTextButton(
            buttonText: 'Follow',
            backgroundColor: ColorsApp.orange,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}