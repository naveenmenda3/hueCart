import 'package:get/get.dart';
import 'package:huecart/features/authentication/screens/onboarding/onboarding.dart';


part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.onBoarding;

  static final routes = [

    GetPage(
      name: _Paths.onBoarding,
      page: () => const onBoardingScreen(),
    ),
  ];
}