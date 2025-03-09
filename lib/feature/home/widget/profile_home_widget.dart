import 'dart:convert';

import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/core/widget/text_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'book_mark_widegt.dart';

class ProfileHomeWidget extends StatefulWidget {
  @override
  _ProfileHomeWidgetState createState() => _ProfileHomeWidgetState();
}

class _ProfileHomeWidgetState extends State<ProfileHomeWidget> {
  List<Map<String, dynamic>> bookmarkedEvents = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedEvents();
  }

  Future<void> _loadBookmarkedEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedEvents = prefs.getStringList('bookmarked_events');

    if (savedEvents != null) {
      setState(() {
        bookmarkedEvents =
            savedEvents
                .map((e) => jsonDecode(e) as Map<String, dynamic>)
                .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(child: Image.asset('assets/images/organizer.png')),
            SizedBox(height: 20.h),
            Text("Ashfak Sayem", style: TextStyles.font19BlackMedium),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(Icons.person, "My Profile"),
                  _buildMenuItem(Icons.message, "Message"),
                  _buildMenuItem(Icons.calendar_today, "Calendar"),
                  _buildBookmarkedSection(), // Display bookmarked events
                  _buildMenuItem(Icons.contact_mail, "Contact Us"),
                  _buildMenuItem(Icons.settings, "Settings"),
                  _buildMenuItem(Icons.help, "Helps & FAQs"),
                  _buildMenuItem(Icons.logout, "Sign Out"),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 150.w,
              child: AppTextButton(
                buttonText: 'Upgrade Pro',
                backgroundColor: ColorsApp.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarkedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookMarkWidegt(showSnackbar: true),
              ),
            );
          },
          child: _buildMenuItem(Icons.bookmark, "Bookmarks"),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.grey.withAlpha(150)),
          SizedBox(width: 20.w),
          Text(title, style: TextStyles.font15GrayRegular),
        ],
      ),
    );
  }
}
