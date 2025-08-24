import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/features/shop/screens/brand/all_brands.dart'; // Add this import

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {},
          ),
          items: banners.map((url) => GestureDetector(
            onTap: () => Get.to(() => const AllBrandsScreen()),
            child: TRoundedContainer(
              clip: true,
              backgroundColor: dark ? AppColors.dark : AppColors.white,
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}