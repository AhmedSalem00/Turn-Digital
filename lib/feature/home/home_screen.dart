import 'dart:math';

import 'package:booking_application/core/helper/extension.dart';
import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/event%20details/event_details_screen.dart';
import 'package:booking_application/feature/event/event_list_screen.dart';
import 'package:booking_application/feature/home/cubit/location_state.dart';
import 'package:booking_application/feature/home/widget/profile_home_widget.dart';
import 'package:booking_application/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/routing/app_routers.dart';
import 'cubit/event_cubit.dart';
import 'cubit/event_state.dart';
import 'cubit/location_cubit.dart';
import 'widget/custom_card_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ProfileHomeWidget(),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(context),
              _buildEventListing(context),
              SizedBox(height: 30.h),
              Image.asset('assets/images/event.png'),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Events",
                      style: TextStyles.font18BlackMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.eventsListScreen);
                      },
                      child: Text(
                        "See All",
                        style: TextStyles.font14BlueRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildCategoryButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: 375.w,
      height: 175.h,
      decoration: BoxDecoration(
        color: ColorsApp.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(33.r),
          bottomRight: Radius.circular(33.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 20.h,
              right: 24.w,
              left: 24.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDrawerButton(context),
                _buildLocationInfo(context),
                _buildNotificationButton(),
              ],
            ),
          ),
          _buildSearchBar(),
        ],
      ),
    );
  }

  Widget _buildDrawerButton(BuildContext context) {
    return InkWell(
      onTap: () => _scaffoldKey.currentState?.openDrawer(),
      child: SvgPicture.asset(
        Assets.svgCombinedShape,
        width: 24.w,
        height: 19.h,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          return CircularProgressIndicator();
        } else if (state is LocationError) {
          return Text(state.message);
        } else if (state is LocationLoaded) {
          return Column(
            children: [
              InkWell(
                onTap: () => context.read<LocationCubit>().toggleLocation(),
                child: Row(
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyles.font12OrangeRegular.copyWith(
                        color: ColorsApp.white.withOpacity(0.70),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    SvgPicture.asset(
                      Assets.svgArrowCurrentLocations,
                      width: 5.w,
                      height: 10.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: context.read<LocationCubit>().showLocation,
                child: Text(
                  "${state.city}, ${state.country}",
                  style: TextStyles.font14BlueRegular.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    fontSize: 13.sp,
                    color: ColorsApp.white,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildNotificationButton() {
    return InkWell(
      onTap: () async {},
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.10),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          Assets.svgNotificatioImage,
          width: 15.w,
          height: 16.h,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 327.w,
      height: 33.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: SvgPicture.asset(
            Assets.svgSearchIcon,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: _buildSearchFilterButton(),
          hintText: "Search...",
          hintStyle: TextStyles.font20WhiteRegular.copyWith(
            color: Colors.white.withOpacity(0.30),
          ),
          border: InputBorder.none,
          isDense: true,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSearchFilterButton() {
    return Container(
      width: 75.w,
      height: 31.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.svgFiltterSearch,
            width: 19.w,
            height: 19.h,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(width: 4.w),
          Text("Filter", style: TextStyles.font12OrangeRegular),
        ],
      ),
    );
  }

  Widget _buildEventListing(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 39.h,
              left: 24.w,
              right: 24.w,
              bottom: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming Events", style: TextStyles.font18BlackMedium),
                TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.eventsListScreen);
                  },
                  child: Text("See All", style: TextStyles.font14BlueRegular),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 210.h,
            child: BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                if (state is EventLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EventError) {
                  return Center(child: Text(state.message));
                } else if (state is EventLoaded) {
                  return state.events.isEmpty
                      ? Center(child: Text("No events available"))
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.events.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => EventDetailsScreen(
                                        event: state.events[index],
                                      ),
                                ),
                              );
                            },
                            child: CustomCardWidget(event: state.events[index]),
                          );
                        },
                      );
                } else {
                  return Center(child: Text("Something went wrong"));
                }
              },
            ),
          ),
        ],
      ),
      );
  }

  Widget _buildCategoryButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 157.h, right: 26.w, left: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryButton('Sports', Assets.svgSports, Colors.brown),
          _buildCategoryButton('Music', Assets.svgMusic, ColorsApp.red),
          _buildCategoryButton('Food', Assets.svgFood, ColorsApp.green),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, String iconPath, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(iconPath),
      label: Text(label, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
