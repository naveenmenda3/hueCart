import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Reviews & Ratings',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '4.8',
                                  style: Theme.of(context).textTheme.displayLarge!.apply(color: AppColors.white),
                                ),
                                const TextSpan(text: '/5'),
                              ],
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('199'),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          Text(
                            'Total Reviews',
                            style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(
                    title: 'Reviews',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReviewCard(
                    dark: dark,
                    name: 'John Doe',
                    date: '12 Jan 2024',
                    rating: 5,
                    review: 'Great product! I love it.',
                  ),
                  ReviewCard(
                    dark: dark,
                    name: 'Jane Smith',
                    date: '11 Jan 2024',
                    rating: 4,
                    review: 'Good quality, but a bit expensive.',
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

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.dark,
    required this.name,
    required this.date,
    required this.rating,
    required this.review,
  });

  final bool dark;
  final String name;
  final String date;
  final int rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkerGrey : AppColors.white,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        border: Border.all(
          color: dark ? AppColors.darkGrey : AppColors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              for (int i = 0; i < rating; i++)
                const Icon(Iconsax.star5, color: Colors.amber, size: 20),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Text(
            review,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
