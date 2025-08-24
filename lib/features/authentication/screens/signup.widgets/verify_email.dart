import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/success_screen/success_screen.dart';
import 'package:huecart/features/authentication/screens/widgets/custom_button.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/text_strings.dart';

class verifyEmail extends StatelessWidget {
  const verifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back;
              },
              icon: const Icon(Icons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Image(
                image: AssetImage(NImages.deliveredEmailIllustration),
                width: 500,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                TTexts.confirmEmail,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "support@naveen.com",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                TTexts.confirmEmailSubTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                  height: 55,
                  width: 420,
                  child: CustomButton(
                      onTap: () {
                        Get.to(() => successScreen(
                            image: NImages.staticSuccessIllustration,
                            title: TTexts.yourAccountCreatedTitle,
                            subtitle: TTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => loginScreen())));
                      },
                      buttonText: TTexts.tContinue)),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend email",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
