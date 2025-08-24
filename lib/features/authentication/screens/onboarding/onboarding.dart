import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/features/authentication/controllers/onboarding_controller.dart';
import 'package:huecart/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:huecart/features/authentication/screens/widgets/onboarding_dotnav.dart';

import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/text_strings.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(onBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: NImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              onBoardingPage(
                image: NImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              onBoardingPage(
                image: NImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const onBoardingSkip(),
          const onBoardingDotNavigation(),
          Positioned(
              bottom: 70,
              right: 30,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.dark,
                  ),
                  onPressed: onBoardingController.instance.nextPage,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ))),
        ],
      ),
    );
  }
}

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      right: 40,
      child: TextButton(
          onPressed: onBoardingController.instance.skipPage,
          child: const Text("skip")),
    );
  }
}
