import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDateWidget extends StatelessWidget {
  final String? date;
  final String? time;
  final String? location;
  final String? address;

  const EventDateWidget({
    super.key,
    required this.date,
    required this.time,
    required this.location,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.calendar_month, color: Colors.orange, size: 22),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$date\n",
                      style: TextStyles.font15GrayRegular.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    TextSpan(
                      text: time,
                      style: TextStyles.font14GrayRegular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.location_on, color: Colors.orange, size: 22),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$address\n",
                      style: TextStyles.font15GrayRegular.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    TextSpan(
                      text: "$location",
                      style: TextStyles.font14GrayRegular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}