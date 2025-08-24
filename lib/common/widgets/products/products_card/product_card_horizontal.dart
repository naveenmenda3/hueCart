import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/brands/brand_title_text_verifed.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/common/widgets/icons/circular_icons.dart';
import 'package:huecart/common/widgets/icons/t_circular_icon.dart';
import 'package:huecart/common/widgets/images/rounded_image.dart';
// Remove duplicate import
// import 'package:huecart/common/widgets/images/t_rounded_image.dart';
import 'package:huecart/common/widgets/texts/product_price_text.dart';
import 'package:huecart/common/widgets/texts/product_title_text.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(  // Changed from TRoundedImage
                    imageUrl: NImages.product1,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: AppColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black),
                    ),
                  ),
                ),

                /// -- Favourite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Green Nike Sports Shoe', smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      BrandTitleVerified(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Pricing
                      const Flexible(child: TProductPriceText(price: '256.0')),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
