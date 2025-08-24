import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:huecart/features/authentication/screens/login/login.dart';

class onBoardingController extends GetxController {
  static onBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
