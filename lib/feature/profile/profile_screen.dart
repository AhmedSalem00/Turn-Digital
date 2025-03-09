import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/profile/data/model/profile_model.dart';
import 'package:booking_application/feature/profile/widget/custom_button_widget.dart';
import 'package:booking_application/feature/profile/widget/event_list_widget.dart';
import 'package:booking_application/feature/profile/widget/profile_header_widget.dart';
import 'package:booking_application/feature/profile/widget/reviews_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/cubit/profile_state.dart';
import 'data/cubit/proifle_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..fetchProfile(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: ColorsApp.white,
          appBar: AppBar(
            backgroundColor: ColorsApp.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: ColorsApp.black),
              onPressed: () => Navigator.pop(context),

            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: ColorsApp.black),
                onPressed: () {},
              ),
            ],
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProfileError) {
                return Center(child: Text(state.errorMessage));
              } else if (state is ProfileLoaded) {
                // Pass profile data to ProfileHeaderWidget
                return Column(
                  children: [
                    ProfileHeaderWidget(profile: state.profile),
                    CustomButtonWidget(),
                    _buildTabBar(),
                    Expanded(child: _buildTabBarView(state.profile)),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      indicatorColor: ColorsApp.orange,
      labelColor: ColorsApp.black,
      dividerColor: ColorsApp.white,
      unselectedLabelColor: ColorsApp.gray,
      tabs: [Tab(text: "ABOUT"), Tab(text: "EVENT"), Tab(text: "REVIEWS")],
    );
  }

  Widget _buildTabBarView(ProfileModel profile) {
    return TabBarView(
      children: [
        _buildAboutSection(profile),
        EventListWidget(events: profile.events),
        ReviewsListWidget(reviews: profile.reviews),
      ],
    );
  }

  Widget _buildAboutSection(ProfileModel profile) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          profile.about,
          style: TextStyles.font15GrayRegular,
        ),
      ),
    );
  }
}
