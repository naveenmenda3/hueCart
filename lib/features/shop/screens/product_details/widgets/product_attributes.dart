import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          children: [
            TSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0 ? AppColors.primary : AppColors.darkGrey,
                      ),
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            TSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: dark ? AppColors.darkerGrey : AppColors.white,
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                        border: Border.all(
                          color: dark ? AppColors.darkGrey : AppColors.grey,
                        ),
                      ),
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text('S'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
