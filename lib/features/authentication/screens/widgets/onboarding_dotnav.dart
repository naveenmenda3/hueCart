import 'package:flutter/material.dart';
import 'package:huecart/features/authentication/controllers/onboarding_controller.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingController.instance;
    return Positioned(
        bottom: 100,
        left: 80,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.dark, dotHeight: 6),
        ));
  }
}
