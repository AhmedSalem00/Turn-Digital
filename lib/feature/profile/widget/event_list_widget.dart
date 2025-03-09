import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EventListWidget extends StatelessWidget {
  final List<EventModel> events;

  const EventListWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              event.picture,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(event.date, style: TextStyles.font12OrangeRegular),
          subtitle: Text(
            event.title,
            style: TextStyles.font18BlackMedium.copyWith(
              fontWeight: FontWeightHelper.regular,
            ),
          ),
        );
      },
    );
  }
}
