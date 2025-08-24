import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';

class SubCategoryBrandsTab extends StatelessWidget {
  const SubCategoryBrandsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(
                title: 'Brands',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              GridLayout(
                itemCount: 6,
                mainAxisExtent: 288,
                itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.all(TSizes.sm),
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
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: dark ? AppColors.darkGrey : AppColors.light,
                          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                        ),
                        child: Center(
                          child: Image(
                            image: const AssetImage(NImages.product1),
                            color: dark ? AppColors.white : AppColors.dark,
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text(
                        'Brand Name',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Text(
                        '123 Products',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}