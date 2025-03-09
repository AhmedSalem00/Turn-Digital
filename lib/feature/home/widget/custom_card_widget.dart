import 'dart:convert';
import 'dart:math';

import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/home/data/model/event_model.dart';
import 'package:booking_application/feature/home/widget/book_mark_widegt.dart';
import 'package:booking_application/feature/home/widget/profile_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helper/notification_servece.dart';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CustomCardWidget extends StatelessWidget {
  final EventHomeModel event;

  const CustomCardWidget({super.key, required this.event});

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('dd MMMM').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      height: 255.h,
      padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 218.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        event.picture ?? '',
                        width: 218.w,
                        height: 131.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: ColorsApp.crimson,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formatDate(event.date ?? '').split(' ')[0],
                          style: TextStyles.font18BlackRegular,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          formatDate(event.date ?? '').split(' ')[1],
                          style: TextStyles.font18BlackRegular,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      List<String> savedEvents = prefs.getStringList('bookmarked_events') ?? [];

                      Map<String, dynamic> eventData = {
                        'title': event.title,
                        'date': event.date.toString(),
                      };

                      bool isAlreadyBookmarked = savedEvents.any(
                            (e) => jsonDecode(e)['title'] == event.title,
                      );

                      if (!isAlreadyBookmarked) {
                        savedEvents.add(jsonEncode(eventData));
                        await prefs.setStringList('bookmarked_events', savedEvents);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookMarkWidegt(showSnackbar: true),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Event saved successfully!', style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Event already bookmarked!', style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.orange,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Container(
                      color: ColorsApp.crimson,
                      child: Icon(Icons.bookmark_border, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            // Row for title and share icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.title ?? '',
                    style: TextStyles.font19BlackMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  if (event.organizer != null) ...[
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(event.organizer!.picture ?? ''),
                      onBackgroundImageError: (exception, stackTrace) => const CircleAvatar(
                        radius: 10,
                        child: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(width: 4),
                    // Additional organizers can be added here
                    Text("event+20 Going${event.numberOfGoing ?? ''}", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.grey),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      event.address ?? '',
                      style: TextStyles.font14BlueRegular.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
