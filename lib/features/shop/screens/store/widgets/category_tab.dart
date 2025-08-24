import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:huecart/utils/constants/image_strings.dart';
class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              GridLayout(
                itemCount: 4,
                mainAxisExtent: 288,
                itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.all(TSizes.sm),
                  decoration: BoxDecoration(
                    color: dark ? AppColors.dark : AppColors.white,
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                    border: Border.all(
                      color: dark ? AppColors.darkGrey : AppColors.grey,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: dark ? AppColors.darkGrey : AppColors.light,
                          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                        ),
                        child: Center(
                          child: Image(
                            image: const AssetImage(NImages.product1),

                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text(
                        'Product Name',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Text(
                        '\$123.45',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
