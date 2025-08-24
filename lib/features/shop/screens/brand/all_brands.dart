import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
// Update the import path
import 'package:huecart/common/widgets/layouts/BrandCard.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/shop/screens/brand/brand_products.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
// First, add the import at the top if not already present
import 'package:huecart/utils/constants/image_strings.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

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
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => const TBrandCard(showBorder: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.dark,
    this.showBorder = false,
    this.onTap,
  });

  final bool dark;
  final bool showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
          color: dark ? AppColors.darkerGrey : AppColors.white,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: AppColors.grey) : null,
        ),
        child: Center(
          child: Image(
            image: const AssetImage(NImages.nikeLogo), // Or use another brand logo constant as needed
            color: dark ? AppColors.white : AppColors.dark,
          ),
        ),
      ),
    );
  }
}
