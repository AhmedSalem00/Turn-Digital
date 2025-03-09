import 'package:booking_application/feature/event%20details/data/model/event_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteContainerWidget extends StatelessWidget {
final  EventDetailsModel event;
   InviteContainerWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(event.picture??''),
                radius: 20,
              ),
              SizedBox(width: 8.w),
              CircleAvatar(
                backgroundImage: NetworkImage(event.picture??''),
                radius: 20,
              ),
              SizedBox(width: 8),
              Text('+20 Going', style: TextStyle(color: Colors.black)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Handle invite action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Invite'),
          ),
        ],
      ),
    );
  }
}
