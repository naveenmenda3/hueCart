import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
      items: banners.map((banner) => RoundedContainer(
        margin: const EdgeInsets.all(TSizes.sm),
        backgroundColor: AppColors.light,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          child: Image.asset(
            banner,
            fit: BoxFit.cover,
          ),
        ),
      )).toList(),
    );
  }
}

