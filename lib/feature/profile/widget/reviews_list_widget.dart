import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/font_weight_helper.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:booking_application/feature/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsListWidget extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ListTile(
          leading: ClipRRect(child: Image.network(review.reviewerPicture)),
          title: Row(
            children: [
              Text(
                review.reviewerName,
                style: TextStyles.font18BlackRegular.copyWith(
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              // Text(review.reviewDate),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  3,
                  (i) => Icon(
                    Icons.star_rate_rounded,
                    size: 17,
                    color: ColorsApp.orange,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              // Text('Rating: ${review.rate}'),
              // Text(review.reviewDate),
              Text(
                review.review,
                style: TextStyles.font15GrayRegular,
              ),
            ],
          ),

        );
      },
    );
  }
}
