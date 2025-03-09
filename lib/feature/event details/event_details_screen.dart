import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/core/widget/text_button.widget.dart';
import 'package:booking_application/feature/event%20details/widget/event_date_widget.dart';
import 'package:booking_application/feature/event%20details/widget/invite_container_widget.dart';
import 'package:booking_application/feature/event%20details/widget/organize_widget.dart';
import 'package:booking_application/feature/home/data/model/event_model.dart';
import 'package:booking_application/feature/profile/profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/cubit/event_details_cubit.dart';
import 'data/cubit/event_details_state.dart';
class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required EventHomeModel event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EventDetailsCubit(Dio())..fetchEventDetails(50),
      child: Scaffold(
        body: BlocBuilder<EventDetailsCubit, EventDetailsState>(
          builder: (context, state) {
            if (state is EventDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EventDetailsSuccess) {
              final event = state.event;

              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(event.picture ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 39.h,
                              left: 20.w,
                              width: 22.w,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: ColorsApp.white,
                                ),
                                onPressed: () => Navigator.pop(context),

                              ),
                            ),
                            Positioned(
                              top: 40.h,
                              right: 20.w,
                              child: IconButton(
                                icon: Icon(Icons.bookmark, color: Colors.white),
                                onPressed: () {},
                              ),
                            ),
                            Positioned(
                              top: 48.h,
                              left: 59.w,
                              child: Text(
                                "Event Details",
                                style: TextStyles.font20WhiteRegular,
                              ),
                            ),
                          ],
                        ),
                      ), // Gradient Overlay

                      Container(
                        height: 300.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withAlpha(5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 280.h, left: 40.w),
                        child: InviteContainerWidget(event: event),
                      ),
                    ],
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event Title
                        Text(
                          event.title ?? '',
                          style: TextStyles.font18BlackRegular.copyWith(
                            fontSize: 35.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),

                        // Date & Time
                        EventDateWidget(
                          date: event.date ?? "Not available",
                          time: event.date ?? '',
                          address: event.addressTitle,
                          location: event.address,
                        ),
                        SizedBox(height: 15.h),
                        // Organizer
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(),
                                ),
                              );
                            },

                          child: OrganizeWidget(
                            organizerName: event.organizer?.name ?? "Unknown",
                            organizerPicture: event.organizer?.picture ?? '',
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // About Event
                        Text("About Event", style: TextStyles.font18GrayMedium),
                        SizedBox(height: 5.h),
                        Text(
                          event.aboutEvent ?? "No details available",
                          style: TextStyles.font18BlackRegular,
                        ),
                        SizedBox(height: 100.h),

                        // Buy Ticket Button
                        Center(
                          child: SizedBox(
                            width: 270.w,
                            child: AppTextButton(
                              backgroundColor: ColorsApp.orange,
                              buttonText:
                                  'Buy Ticket \$${event.eventPrice?.toStringAsFixed(2) ?? "120"}',
                              textStyle: TextStyles.font15GrayRegular.copyWith(
                                fontSize: 16.sp,
                                color: ColorsApp.white,
                              ),
                              icon: Icons.arrow_forward,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is EventDetailsError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyles.font18BlackRegular,
                ),
              );
            } else {
              return Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }
}
