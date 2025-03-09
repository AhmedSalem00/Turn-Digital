import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeaderWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(profile.picture),
        ),
        SizedBox(height: 12.h),

        // Display the profile name
        Text(profile.name, style: TextStyles.font24GrayRegular.copyWith(fontWeight: FontWeightHelper.bold)),
        SizedBox(height: 6.h),

        // Display the following and followers count
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(profile.numberOfFollowing.toString(), style: TextStyles.font18GrayMedium),
                Text("Following", style: TextStyles.font14BlueRegular),
              ],
            ),
            SizedBox(width: 30.w),
            Column(
              children: [
                Text(profile.numberOfFollowers.toString(), style: TextStyles.font18GrayMedium),
                Text("Followers", style: TextStyles.font14BlueRegular),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

