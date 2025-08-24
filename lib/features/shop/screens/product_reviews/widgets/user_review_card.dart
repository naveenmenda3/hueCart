import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/common/widgets/products/rating/rating_bar_indicator_widget.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(NImages.userProfileImage1),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Naveen Menda',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: 5,
        ),

        /// Review
        const Row(
          children: [
            RatingBarIndicatorWidget(rating: 4),
            SizedBox(
              width: 20,
            ),
            Text(
              '01 Nov, 2024',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const ReadMoreText(
          "Wow this is wonder full application and UI is just awesome. I just love it.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const RoundedContainer(
          backgroundColor: AppColors.grey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      "02 N0v, 2024",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  "Thank you for your review, we are glad to recieve such a response.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
